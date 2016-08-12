package com.cafe24.seoje1004.contract.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.seoje1004.contract.model.Contract;
import com.cafe24.seoje1004.contract.model.ContractFile;
import com.cafe24.seoje1004.contract.repository.ContractDao;

import com.cafe24.seoje1004.util.Search;

/**
 * 최종수정일 2016-07-28 오성현
 * contractService 생성
 */


@Service
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	ContractDao contractDao;
	
	
	//가맹점이 해당가맹점의 계약리스트를 리뷰
	@Override
	public List<Contract> subViewContractList(String subCode, Search search) {
			System.out.println("ContractServiceImpl subViewContractList실행");
			
			//맵안에 검색 및 컬럼정렬 정보와 subCode를 담아주자
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("subCode", subCode);
			map.put("search", search);
			
			
		return contractDao.subViewContractList(map);
	}

	//가맹이 계약등록을 신청
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subAddContract(Contract contract, HttpServletRequest request) {
		System.out.println("ContractServiceImpl subAddContract실행");
		
		//기본 계약정보 등록 신청
		contractDao.subAddContract(contract);
		
		//파일정보 등록신청
		//맵퍼에서 방금 등록한 contractCode값을 가져와 스트링형변수 contractCode에 담는다. file등록하기위해서임
				String contractCode = contract.getContractCode();
				System.out.println("contractCode : " + contractCode);
				
				//파일은 배열안에있으므로 하나씩 꺼내다 작업하자.
				for(int i =0; i<contract.getContractFile().size(); i++){
					//i번째 파일을 멀티파트파일에 담아주자
					MultipartFile file = contract.getContractFile().get(i);
					
					//실제 주소를 path에 담자
					String path = request.getServletContext().getRealPath("/");
					System.out.println("path : "+path);
					
					//전체이름
					String allName = contract.getContractFile().get(i).getOriginalFilename();
				
					//잘라낼 크기를 구하자 
					int pathLength = allName.length();	//전체길이
					int cutLength = contract.getContractFile().get(i).getOriginalFilename().lastIndexOf('\\')+1;	//잘라낼 시작점
					System.out.println("pathLength : "+pathLength);
					System.out.println("cutLength : "+cutLength);
					
					//사용할 파일명
					String fileName = allName.substring(cutLength,pathLength);
					System.out.println("allname : "+allName);
					System.out.println("fileName: "+fileName);
				
					//확장자명
					int pathLength2 = allName.length();	//전체길이
					int cutLength2 = contract.getContractFile().get(i).getOriginalFilename().lastIndexOf('.')+1;	//잘라낼 시작점
					String mineType  = allName.substring(cutLength2,pathLength2);
					System.out.println("mineType : "+ mineType);
					
					//이름 랜덤으로 생성하기 DB에 같은이름으로 저장되면 안되니...
					String randomName = null;
					StringBuffer buffer = new StringBuffer();
					Random random = new Random();
					String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".split(",");
					for ( int j=0 ; j<20 ; j++ ) {
						buffer.append(chars[random.nextInt(chars.length)]);
					}
					String ints[] = "1,2,3,4,5,6,7,8,9".split(",");
					for (int j=0; j<10; j++){
						buffer.append(ints[random.nextInt(ints.length)]);
					}
					
					//생성한 randomName을 담자
					System.out.println("buffer.toString() : "+buffer.toString());
					randomName = buffer.toString();
					
					//실제로 파일을 저장하기위해서 그리고 randomName으로 저장해야하니 아래와같이 랜덤네임으로 저장할 수 있도록 해주자
					File destFile = new File(path+"resources/upload/"+randomName+"."+mineType);
					System.out.println("destFile : "+path+"resources/upload/"+randomName+"."+mineType);
					
					//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
					if(contractDao.selectContractFileByRandomName(randomName) == (null)){
						System.out.println("동일한 randomName 존재하지 않아요.");
						ContractFile contractFile = new ContractFile();
						
						contractFile.setContractCode(contractCode);
						contractFile.setContractFile("/resources/upload/"+randomName+"."+mineType);
						contractFile.setFileName(fileName);
						contractFile.setRandomName(randomName);
						System.out.println("contractFile : "+contractFile);
						
						//articleFile insert
						contractDao.subAddContractFile(contractFile);
						
						try {
							//실제 resources/upload 폴더에 저장
							file.transferTo(destFile);
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
					
					}else{
						System.out.println("동일한 randomName 존재합니다.");
						subAddContract(contract,request);	//재귀호출
						//새로운 randomName으로 실행
					}

				}

		
		
	}
	
	//subCode가 있는지 중복체크
	@Override
	public int subCodeCheck(String subCode) {
		System.out.println("ContractServiceImpl subCodeCheck실행");
		System.out.println("subCode : "+ subCode);
		return contractDao.subCodeCheck(subCode);
	}

	//가맹이 계약상세정보를 리뷰
	@Override
	public Map<String,Object> subViewContractContent(String contractCode) {
		System.out.println("ContractServiceImpl subViewContractContent실행");
		Map<String,Object> map = new HashMap<String, Object>();
		
		//계약 상세정보
		Contract contract = contractDao.subViewContractContent(contractCode);
		
		//계약파일 리스트
		List<ContractFile> contractFile = contractDao.subViewContractFile(contractCode);
		
		//파기사유서 파일 리스트
		List<ContractFile> contractExpireFile = contractDao.subViewContractExpireFile(contractCode);
		
		map.put("contractExpireFile", contractExpireFile);
		map.put("contractFile", contractFile);
		map.put("contract", contract);
		return map;
	}

	//해당 contractCode에 해당하는 계약정보를 재계약 신청폼으로
	@Override
	public Contract subSelectContract(String contractCode) {
		System.out.println("ContractServiceImpl subSelectContract 실행");
		return contractDao.subSelectContract(contractCode);
	}
	
	//재계약 신청 등록 처리
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subAddRecharterContract(Contract contract, HttpServletRequest request) {
		System.out.println("ContractServiceImpl subAddRecharterContract 실행");
		//이전 contractCode 추출
		String precontractCode = contract.getContractCode();
		
		//재계약 신청 등록
		contractDao.subAddRecharterContract(contract);
	
		//이전계약 상태 Y로 update	
		contractDao.subUpdatePreContract(precontractCode);
		
		//파일정보 등록신청
		//맵퍼에서 방금 등록한 contractCode값을 가져와 스트링형변수 contractCode에 담는다. file등록하기위해서임
					String contractCode = contract.getContractCode();
					System.out.println("contractCode : " + contractCode);
					
					//파일은 배열안에있으므로 하나씩 꺼내다 작업하자.
					for(int i =0; i<contract.getContractFile().size(); i++){
						//i번째 파일을 멀티파트파일에 담아주자
						MultipartFile file = contract.getContractFile().get(i);
						
						//실제 주소를 path에 담자
						String path = request.getServletContext().getRealPath("/");
						System.out.println("path : "+path);
						
						//전체이름
						String allName = contract.getContractFile().get(i).getOriginalFilename();
					
						//잘라낼 크기를 구하자 
						int pathLength = allName.length();	//전체길이
						int cutLength = contract.getContractFile().get(i).getOriginalFilename().lastIndexOf('\\')+1;	//잘라낼 시작점
						System.out.println("pathLength : "+pathLength);
						System.out.println("cutLength : "+cutLength);
						
						//사용할 파일명
						String fileName = allName.substring(cutLength,pathLength);
						System.out.println("allname : "+allName);
						System.out.println("fileName: "+fileName);
					
						//확장자명
						int pathLength2 = allName.length();	//전체길이
						int cutLength2 = contract.getContractFile().get(i).getOriginalFilename().lastIndexOf('.')+1;	//잘라낼 시작점
						String mineType  = allName.substring(cutLength2,pathLength2);
						System.out.println("mineType : "+ mineType);
						
						//이름 랜덤으로 생성하기 DB에 같은이름으로 저장되면 안되니...
						String randomName = null;
						StringBuffer buffer = new StringBuffer();
						Random random = new Random();
						String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".split(",");
						for ( int j=0 ; j<20 ; j++ ) {
							buffer.append(chars[random.nextInt(chars.length)]);
						}
						String ints[] = "1,2,3,4,5,6,7,8,9".split(",");
						for (int j=0; j<10; j++){
								buffer.append(ints[random.nextInt(ints.length)]);
						}
						
						//생성한 randomName을 담자
						System.out.println("buffer.toString() : "+buffer.toString());
						randomName = buffer.toString();
						
						//실제로 파일을 저장하기위해서 그리고 randomName으로 저장해야하니 아래와같이 랜덤네임으로 저장할 수 있도록 해주자
						File destFile = new File(path+"resources/upload/"+randomName+"."+mineType);
						System.out.println("destFile : "+path+"resources/upload/"+randomName+"."+mineType);
						
						//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
						if(contractDao.selectContractFileByRandomName(randomName) == (null)){
							System.out.println("동일한 randomName 존재하지 않아요.");
							ContractFile contractFile = new ContractFile();
							
							contractFile.setContractCode(contractCode);
							contractFile.setContractFile("/resources/upload/"+randomName+"."+mineType);
							contractFile.setFileName(fileName);
							contractFile.setRandomName(randomName);
							System.out.println("contractFile : "+contractFile);
							
							//articleFile insert
							contractDao.subAddContractFile(contractFile);
							
							try {
								//실제 resources/upload 폴더에 저장
								file.transferTo(destFile);
							} catch (IllegalStateException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						
						
						}else{
							System.out.println("동일한 randomName 존재합니다.");
							subAddContract(contract,request);	//재귀호출
								//새로운 randomName으로 실행
						}
						}
		
	}
	
	//가맹계약파기
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subExpireContract(Contract contract,HttpServletRequest request) {
		System.out.println("ContractServiceImpl subExpireContract실행");
		
		//1.파기일 업데이트
		contractDao.expireContract(contract);
		
		//2.파기사유서 파일 업로드	
			String contractCode = contract.getContractCode();
			System.out.println("contractCode : " + contractCode);
			//파일은 배열안에있으므로 하나씩 꺼내다 작업하자.
			for(int i =0; i<contract.getContractExpireFile().size(); i++){
				//i번째 파일을 멀티파트파일에 담아주자
				MultipartFile file = contract.getContractExpireFile().get(i);
				//실제 주소를 path에 담자
				String path = request.getServletContext().getRealPath("/");
				System.out.println("path : "+path);	
				//전체이름
				String allName = contract.getContractExpireFile().get(i).getOriginalFilename();
						
				//잘라낼 크기를 구하자 
				int pathLength = allName.length();	//전체길이
				int cutLength = contract.getContractExpireFile().get(i).getOriginalFilename().lastIndexOf('\\')+1;	//잘라낼 시작점
				System.out.println("pathLength : "+pathLength);
				System.out.println("cutLength : "+cutLength);
						
				//사용할 파일명
				String fileName = allName.substring(cutLength,pathLength);
				System.out.println("allname : "+allName);
				System.out.println("fileName: "+fileName);
					
				//확장자명
				int pathLength2 = allName.length();	//전체길이
				int cutLength2 = contract.getContractExpireFile().get(i).getOriginalFilename().lastIndexOf('.')+1;	//잘라낼 시작점
				String mineType  = allName.substring(cutLength2,pathLength2);
				System.out.println("mineType : "+ mineType);
					
				//이름 랜덤으로 생성하기 DB에 같은이름으로 저장되면 안되니...
				String randomName = null;
				StringBuffer buffer = new StringBuffer();
				Random random = new Random();
				String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".split(",");
				for ( int j=0 ; j<20 ; j++ ) {
					buffer.append(chars[random.nextInt(chars.length)]);
				}
				String ints[] = "1,2,3,4,5,6,7,8,9".split(",");
				for (int j=0; j<10; j++){
						buffer.append(ints[random.nextInt(ints.length)]);
				}
				//생성한 randomName을 담자
				System.out.println("buffer.toString() : "+buffer.toString());
				randomName = buffer.toString();
							
				//실제로 파일을 저장하기위해서 그리고 randomName으로 저장해야하니 아래와같이 랜덤네임으로 저장할 수 있도록 해주자
				File destFile = new File(path+"resources/upload/"+randomName+"."+mineType);
				System.out.println("destFile : "+path+"resources/upload/"+randomName+"."+mineType);
				//랜덤네임이 중복되는 이름이 있으면 다시 새로운 랜덤네임으로 저장
				if(contractDao.selectContractFileByRandomName(randomName) == (null)){
					System.out.println("동일한 randomName 존재하지 않아요.");
					ContractFile contractFile = new ContractFile();
						
					contractFile.setContractCode(contractCode);
					contractFile.setContractFile("/resources/upload/"+randomName+"."+mineType);
					contractFile.setFileName(fileName);									
					contractFile.setRandomName(randomName);
					System.out.println("contractFie : "+contractFile);
								
					//articleFile insert
					contractDao.subAddContractExpireFile(contractFile);
								
					try {
						//실제 resources/upload 폴더에 저장
						file.transferTo(destFile);
					} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
								
								
					}else{
						System.out.println("동일한 randomName 존재합니다.");
						subExpireContract(contract,request);	//재귀호출
						//새로운 randomName으로 실행
					}
				}
		
	}

	
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	/*--------------------------------------------------------------------아래부터는 본사구간----------------------------------------------------------------------------------*/
	
	
	
	//본사에서 전체 계약진행 리스트 조회
	@Override
	public List<Contract> headViewContract(Search search) {
		System.out.println("ContractServiceImpl headViewContract 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		
		return contractDao.headViewContract(map);
	}

	//본사에서 계약 승인처리
	@Override
	public void headApproveContract(String contractCode) {
		System.out.println("ContractServiceImpl headApproveContract 실행");
		
		contractDao.headApproveContract(contractCode);
	}

}
