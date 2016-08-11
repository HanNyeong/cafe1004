package com.cafe24.seoje1004.returns.service;

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

import com.cafe24.seoje1004.contract.model.ContractFile;
import com.cafe24.seoje1004.returns.model.AddReturns;
import com.cafe24.seoje1004.returns.model.Delivery;
import com.cafe24.seoje1004.returns.model.Returns;
import com.cafe24.seoje1004.returns.model.ReturnsFile;
import com.cafe24.seoje1004.returns.model.ReturnsSearch;
import com.cafe24.seoje1004.returns.model.SubOrders;
import com.cafe24.seoje1004.returns.model.SubStock;
import com.cafe24.seoje1004.returns.model.SubStockSearch;
import com.cafe24.seoje1004.returns.repository.ReturnsDao;
import com.cafe24.seoje1004.subAccount.model.AddSharedSubAccount;
import com.cafe24.seoje1004.util.Search;

@Service
public class ReturnsServiceImpl implements ReturnsService {

	@Autowired
	ReturnsDao returnsDao;
	
	//가맹측 반품상품관리 조회
	@Override
	public List<Returns> subViewReturnsList(String subCode, Search search) {
		System.out.println("ReturnsServiceImpl subViewReturnsList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("search", search);
		return returnsDao.subViewReturnsList(map);
	}
	
	//출고상태가 N, 가맹이확인하고 입고한날짜 not null
	@Override
	public List<SubStock> subAddReturnsForm(String subCode, Search search) {
		System.out.println("ReturnsServiceImpl subAddReturnsForm 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("subCode", subCode);
		map.put("search", search);
		return returnsDao.subAddReturnsForm(map);
	}
	

	//해당재고를 기준으로 반품등록에 필요한 정보를 가져오자
	@Override
	public AddReturns subAddReturnsForm2(String subStockCode) {
		System.out.println("ReturnsServiceImpl subAddReturnsForm2 실행");
		return returnsDao.subAddReturnsForm2(subStockCode);
	}

	//returns테이블에 새로운 환불 등록,해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subAddReturns(Returns returns,HttpServletRequest request,String ordersCode) {
		System.out.println("ReturnsServiceImpl subAddReturns 실행");
		String subStockCode = returns.getSubStockCode();
		
		//1. 환불 신청시 해당 재고상품의 출고여부(판매여부)를 N->Y로 변경
		returnsDao.updateSubStockOut(subStockCode);
		
		//2. returns테이블에 새로운 환불 등록
		returnsDao.subAddReturns(returns);
		
		//파일정보 등록신청
		//맵퍼에서 방금 등록한 returnCode값을 가져와 스트링형변수 returnCode에 담는다. file등록하기위해서임
		String returnCode = returns.getReturnCode();
		System.out.println("returnCode : " + returnCode);
				
		//파일은 배열안에있으므로 하나씩 꺼내다 작업하자.
		for(int i =0; i<returns.getReturnFile().size(); i++){
			//i번째 파일을 멀티파트파일에 담아주자
			MultipartFile file = returns.getReturnFile().get(i);
						
			//실제 주소를 path에 담자
			String path = request.getServletContext().getRealPath("/");
			System.out.println("path : "+path);
							
			//전체이름
			String allName = returns.getReturnFile().get(i).getOriginalFilename();
					
			//잘라낼 크기를 구하자 
			int pathLength = allName.length();	//전체길이
			int cutLength = returns.getReturnFile().get(i).getOriginalFilename().lastIndexOf('\\')+1;	//잘라낼 시작점
			System.out.println("pathLength : "+pathLength);
			System.out.println("cutLength : "+cutLength);
							
			//사용할 파일명
			String fileName = allName.substring(cutLength,pathLength);
			System.out.println("allname : "+allName);
			System.out.println("fileName: "+fileName);
						
			//확장자명
			int pathLength2 = allName.length();	//전체길이
			int cutLength2 = returns.getReturnFile().get(i).getOriginalFilename().lastIndexOf('.')+1;	//잘라낼 시작점
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
			if(returnsDao.selectReturnFileByRandomName(randomName) == (null)){
				System.out.println("동일한 randomName 존재하지 않아요.");
				ReturnsFile returnsFile = new ReturnsFile();
						
				returnsFile.setReturnCode(returnCode);
				returnsFile.setReturnFile("/resources/upload/"+randomName+"."+mineType);
				returnsFile.setFileName(fileName);
				returnsFile.setRandomName(randomName);
				System.out.println("returnsFile : "+returnsFile);
								
				//returnsFile insert
				returnsDao.subAddReturnsFile(returnsFile);
						
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
				subAddReturns(returns,request,ordersCode);	//재귀호출
				//새로운 randomName으로 실행
			}

		}
	
	}

	//가맹측 환불 취소
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void subCancelReturns(String returnCode, String ordersCode) {
		System.out.println("ReturnsServiceImpl subCancelReturns 실행");
		//1.해당 returnCode에 해당하는 행 삭제
		returnsDao.subCancelReturns(returnCode);
		//2.orders_code에 해당하는 subStock가맹재고의 subStockOut출고여부를 Y->N으로 수정
		returnsDao.updateSubStockOutN(ordersCode);
	}
	
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	/*---------------------------------------------------------- 구분선 ----------------------------------------------------------*/
	
	//본사측 반품상품관리 조회
	@Override
	public List<Returns> headViewReturnsList(Search search) {
		System.out.println("ReturnsServiceImpl headViewReturnsList 실행");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		return returnsDao.headViewReturnsList(map);
	}

	//반품상품 상세보기
	@Override
	public Map<String, Object> viewReturnsContent(String returnCode) {
		System.out.println("ReturnsServiceImpl viewReturnsContent 실행");
		//1.해당 반품상품의 상세정보
		Returns returns = returnsDao.viewReturnsContent(returnCode);
		
		//2.해당반품상품의 파일 리스트
		List<ReturnsFile> returnsFile = returnsDao.viewReturnsFile(returnCode);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("returns", returns);
		map.put("returnsFile", returnsFile);
		return map;
	}

	//본사에서 환불 승인
	@Override
	public void approvalReturns(String returnCode) {
		System.out.println("ReturnsServiceImpl approvalReturns 실행");
		returnsDao.approvalReturns(returnCode);
		
	}

	//본사에서 재배송처리
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Exception.class)
	@Override
	public void headReturnReDelivery(String ordersCode) {
		System.out.println("ReturnsServiceImpl headReturnReDelivery 실행");

		//ordersCode를 기준으로 값을 변경해주면된다.
		//1.환불테이블의 headReturnsConfirm을 Y로 변경 update
		returnsDao.updateHeadReturnsConfirmY(ordersCode);
		
		//2.sub_orders의 기존행의 sub_orders_status = "환불" update
		returnsDao.updateSubOrdersStatus(ordersCode);
		
		//3.sub_orders의 기존행의 정보를 가져옴
		SubOrders subOrders = returnsDao.selectSubOrdersByOrdersCode(ordersCode);
		
		//4.sub_orders새로운 행에 insert
		returnsDao.addSubOrders(subOrders);
		
		//5.배송테이블의 deliveryReturn을 Y로 변경 update
		returnsDao.updateDeliveryReturn(ordersCode);
		
		//6.배송테이블의 delivery에 기존행의 정보를 가져옴
		Delivery delivery = returnsDao.selectDeliveryByOrdersCode(ordersCode);
		
		//7.delivery에 새로운행에 insert
		returnsDao.addDelivery(delivery);
	}
	
	//본사에서 환불 처리 (돈으로 지급)
	@Override
	public void headReturns(String returnCode) {
		System.out.println("ReturnsServiceImpl headReturns 실행");
		Returns returns = returnsDao.viewReturnsContent(returnCode);
		System.out.println("returns : "+ returns);
		
		AddSharedSubAccount addSharedSubAccount = new AddSharedSubAccount();
		addSharedSubAccount.setSubAccountFlow("출금");
		addSharedSubAccount.setSubAccountPrice(returns.getReturnPrice());
		addSharedSubAccount.setSubCode(returns.getSubCode());
		addSharedSubAccount.setTotalAccountGroup(returns.getTotalAccountGroup());
		addSharedSubAccount.setSubAccountDetail("상품 환불");
		addSharedSubAccount.setSubjectCode("상품 환불");
		
		//1.회계에 추가
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("addSharedSubAccount", addSharedSubAccount);
		
		returnsDao.headReturns(map);
		
		//2.환불테이블의 headReturnsConfirm을 Y로 변경 update
		returnsDao.updateHeadReturnsConfirmY(returns.getReturnCode());
	}
}
