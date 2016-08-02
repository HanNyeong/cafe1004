package com.cafe24.seoje1004.claim.service;

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

import com.cafe24.seoje1004.claim.model.Claim;
import com.cafe24.seoje1004.claim.model.ClaimFile;
import com.cafe24.seoje1004.claim.model.ClaimSearch;
import com.cafe24.seoje1004.claim.repository.ClaimDao;
import com.cafe24.seoje1004.contract.model.ContractFile;

/**
 * 최종수정일 2016-07-30 오성현
 * ClaimService
 */

@Service
public class ClaimServiceImpl implements ClaimService {

	@Autowired
	ClaimDao claimDao;
	
	//본사가 전체클래임리스트 조회
	@Override
	public List<Claim> headViewClaimList(ClaimSearch claimSearch) {
		System.out.println("ClaimServiceImpl headViewClaimList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claimSearch", claimSearch);
		return claimDao.headViewClaimList(map);
	}

	//claimCode에 해당하는 클래임 상세정보출력
	@Override
	public Map<String, Object> viewClaimContent(String claimCode) {
		System.out.println("ClaimServiceImpl viewClaimContent");
		//1.클래임 상세정보  
		Claim claimContent = claimDao.viewClaimContent(claimCode);
		
		//2.해당클래임의 파일리스트
		List<ClaimFile>	claimFile = claimDao.viewClaimFile(claimCode);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claimContent", claimContent);
		map.put("claimFile", claimFile);
		return map;
	}

	//해당클레임에 대한 정보를 가져와서 수정해야하므로 해당정보를 가져와주자
	@Override
	public Claim headAnswerClaimForm(String claimCode) {
		System.out.println("ClaimServiceImpl headAnswerClaimForm 실행");
		return claimDao.headAnswerClaimForm(claimCode);
	}

	//답변처리 업데이트 하기
	@Override
	public void headAnswerClaim(Claim claim) {
		System.out.println("ClaimServiceImpl headAnswerClaim 실행");
		claimDao.headAnswerClaim(claim);
	}
	
		
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	//가맹이 해당점의 클래임리스트 조회
	@Override
	public List<Claim> subViewClaimList(String subCode, ClaimSearch claimSearch) {
		System.out.println("ClaimServiceImpl subViewClaimList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("claimSearch", claimSearch);
		
		return claimDao.subViewClaimList(map);
	}
	
	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/	
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	/*--------------------------------------------------구분선--------------------------------------------------*/
	
	
	//고객이 자신의 클래임을 조회
	@Override
	public List<Claim> customerViewClaimList(Claim claim,ClaimSearch claimSearch) {
		System.out.println("ClaimServiceImpl customerViewClaimList");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("claim", claim);
		map.put("claimSearch", claimSearch);
		System.out.println("map : "+map);
		return claimDao.customerViewClaimList(map);
	}

	//고객이 클래임 등록을 처리
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void customerAddClaim(Claim claim, HttpServletRequest request) {
		System.out.println("ClaimServiceImpl customerAddClaim");
		//1.고객이 클래임을 등록
		claimDao.customerAddClaim(claim);
		
		//2.고객이 파일을 등록
		//맵퍼에서 방금 등록한 contractCode값을 가져와 스트링형변수 contractCode에 담는다. file등록하기위해서임
		String claimCode = claim.getClaimCode();
		System.out.println("claimCode : " + claimCode);
			
		//파일은 배열안에있으므로 하나씩 꺼내다 작업하자.
		for(int i =0; i<claim.getClaimFile().size(); i++){
			//i번째 파일을 멀티파트파일에 담아주자
			MultipartFile file = claim.getClaimFile().get(i);
							
			//실제 주소를 path에 담자
			String path = request.getServletContext().getRealPath("/");
			System.out.println("path : "+path);
							
			//전체이름
			String allName = claim.getClaimFile().get(i).getOriginalFilename();
					
			//잘라낼 크기를 구하자 
			int pathLength = allName.length();	//전체길이
			int cutLength = claim.getClaimFile().get(i).getOriginalFilename().lastIndexOf('\\')+1;	//잘라낼 시작점
			System.out.println("pathLength : "+pathLength);
			System.out.println("cutLength : "+cutLength);
							
			//사용할 파일명
			String fileName = allName.substring(cutLength,pathLength);
			System.out.println("allname : "+allName);
			System.out.println("fileName: "+fileName);
						
			//확장자명
			int pathLength2 = allName.length();	//전체길이
			int cutLength2 = claim.getClaimFile().get(i).getOriginalFilename().lastIndexOf('.')+1;	//잘라낼 시작점
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
			if(claimDao.selectClaimFileByRandomName(randomName) == (null)){
				System.out.println("동일한 randomName 존재하지 않아요.");
				ClaimFile claimFile = new ClaimFile();
								
				claimFile.setClaimCode(claimCode);
				claimFile.setClaimFile("/resources/upload/"+randomName+"."+mineType);
				claimFile.setFileName(fileName);
				claimFile.setRandomName(randomName);
				System.out.println("claimFile : "+claimFile);
								
				//고객이 클래임 파일을 등록
				claimDao.customerAddClaimFile(claimFile);
								
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
					customerAddClaim(claim,request);	//재귀호출
					//새로운 randomName으로 실행
				}

			}
		
		
	}

	//고객이 클래임 삭제 처리
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void customerDeleteClaim(String claimCode) {
		System.out.println("ClaimServiceImpl customerDeleteClaim 실행");
		
		//고객이 클래임 삭제처리
		claimDao.customerDeleteClaim(claimCode);
		
		//고객이 해당클래임에 관련된 파일 삭제처리
		claimDao.customerDeleteClaimFile(claimCode);
		
	}

	
	
	
}
