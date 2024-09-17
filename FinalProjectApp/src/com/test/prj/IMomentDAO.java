/*====================
	IMomentDAO.java
	- 인터페이스
====================*/

package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IMomentDAO
{
	// 그룹 페이지에서 모든 모먼트 리스트 확인
	public ArrayList<MomentDTO> allList(String group_id);
	
	// 이미 지나간(끝난) 모먼트 확인
	public ArrayList<MomentDTO> oldList(String group_id);
	
	// 계획기간 지난 모먼트 있는지 확인
	public ArrayList<MomentDTO> searchEndMoment(String group_id);
	
	// 계획기간 지난 모먼트 비활성화
	public int addNonactiveMoment(@Param("moment_id") String moment_id, @Param("type_id") String type_id);
	
	// 그룹 페이지에서 내가 참여 중인 모먼트 리스트 확인
	public ArrayList<MomentDTO> myList(@Param("group_id") String group_id, @Param("member_id") String member_id);
	
	// 그룹 내 모든 모먼트 수 확인
	public int allCount(String group_id);
	
	// 그룹 내 내가 참여 중인 모먼트 수 확인
	public int myCount(@Param("group_id") String group_id, @Param("member_id") String member_id);
	
	// 그룹원 수 확인
	public int countMember(String group_id);

	// 날짜 컬럼 수 확인
	public int countDate();
	
	// 모먼트 날짜 데이터 입력(추가)
	public int addDate(MomentDTO dto);
	
	// 장소 컬럼 수 확인
	public int countPlace();
	
	// 모먼트 장소 데이터 입력(추가)
	public int addPlace(MomentDTO dto);

	// 전체 모먼트 수 확인
	public int countMoment();
	
	// 모먼트 데이터 입력(추가)
	public int addMoment(MomentDTO dto);
	
	// 그룹원인지 확인
	public int countMemberId(@Param("user_id") String user_id, @Param("group_id") String group_id);

	// 그룹원 아이디 확인
	public String searchMemberId(@Param("user_id") String user_id, @Param("group_id") String group_id);

	// 모먼트 참여자 데이터 입력(추가)
	public int addMomentMember(MomentDTO dto);

	// 모먼트 조회 페이지에서 해당 모먼트 정보 확인
	public MomentDTO momentList(String moment_id);
	
	// 이미 참여 중인 모먼트인지 확인
	public int momentJoinCount(@Param("user_id") String user_id, @Param("moment_id") String moment_id);

	// 모먼트 모든 참여자 확인
	public int momentJoinAllCount(@Param("moment_id") String moment_id);
	
	// 이중약속 확인
	public int momentDateCount(@Param("user_id") String user_id, @Param("date_name") String date_name);
	
	// 단계 변경
	public int modifyPhase(@Param("moment_id") String moment_id, @Param("phase_id") String phase_id);
	
	// 모먼트 참여자인지 확인
	public int partiCount(@Param("member_id") String member_id, @Param("moment_id") String moment_id);

	// 모먼트 참여자 아이디 찾기
	public String getPartiId(@Param("member_id") String member_id, @Param("moment_id") String moment_id);
	
	// 모먼트 참여자 닉네임 찾기
	public ArrayList<MomentDTO> getPartiName(@Param("moment_id") String moment_id);
	
	// 모먼트 참여 취소 
	public int cancelMoment(String participant_id);
	
	// 각각 설문 존재하는지 확인
	public int surveyCount(@Param("moment_id") String moment_id, @Param("type_id") String type_id);
	
	// 설문 전체 개수 확인
	public int countSurveyNum();
	
	// 모먼트 설문 생성
	public int addSurvey(@Param("survey_id") String survey_id, @Param("moment_id") String moment_id, @Param("type_id") String type_id);
	
	// 설문코드 찾기
	public String searchSurveyId(@Param("type_id") String type_id, @Param("moment_id") String moment_id);
	
	// 설문 응답 데이터 추가
	public int addSurveyResponse(@Param("survey_id") String survey_id, @Param("participant_id") String participant_id
			, @Param("response") String response, @Param("others") String others, @Param("impossible_date") String impossible_date);
	
	// 설문 응답했는지 확인
	public int countSurveyResponseNum(@Param("survey_id") String survey_id, @Param("participant_id") String participant_id, @Param("moment_id") String moment_id);
	
	// 설문 응답 내용 확인
	public MomentDTO countSurveyResponse(@Param("survey_id") String survey_id, @Param("participant_id") String participant_id, @Param("moment_id") String moment_id);
	
	// 설문 안 한 것 확인 ?
	//public MomentDTO countSrveyParticipant();
	
	// 설문 완료됐는지 확인
	public ArrayList<MomentDTO> checkSurveyComplete(@Param("moment_id") String moment_id, @Param("survey_id") String survey_id);

	// 설문 답 하나인지 확인
	public ArrayList<MomentDTO> checkSurveyOneComplete(@Param("moment_id") String moment_id, @Param("survey_id") String survey_id);
	
	// 각각 투표 존재하는지 확인
	public int voteCount(@Param("survey_id") String survey_id, @Param("type_id") String type_id);
	
	// 투표 전체 개수 확인
	public int countVoteNum();
	
	// 투표 생성
	public int addVote(@Param("vote_id") String vote_id, @Param("survey_id") String survey_id, @Param("type_id") String type_id);
	
	// 투표 아이디 가져오기
	public String getVoteId(@Param("survey_id") String survey_id);
	
	// 투표 결과 데이터 추가
	public int addVoteResponse(@Param("vote_id") String vote_id, @Param("survey_response_id") String survey_response_id, @Param("participant_id") String participant_id);
	
	// 사용자가 투표했는지 확인
	public int CountVoteResponseNum(@Param("type_id") String type_id, @Param("participant_id") String participant_id);
	
	// 투표 선택지 값 가져오기
	public String getVoteResponse(@Param("participant_id") String participant_id, @Param("type_id") String type_id);
	
	// 투표 끝났는지 확인
	public int checkVoteComplete(@Param("vote_id") String vote_id);
	
	// 투표 1위 값 확인하기
	public String getVoteMax(@Param("vote_id") String vote_id);
	
	// 투표 수정된적 있는지 확인
	public int checkModifyVoteComplete(@Param("vote_id") String vote_id);

	// 설문 수정된적 있는지 확인
	public int checkModifySurveyComplete(@Param("survey_id") String survey_id);
	
	// 모먼트명 수정
	public int modifyMomentName(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);

	// 날짜 수정
	public int modifyDateName(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);
	
	// 장소 수정
	public int modifyPlaceName(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);
	
	// 장소 세부 단계 수정
	public int modifyPlaceDetail(@Param("moment_id") String moment_id);
	
	// 최소 인원 수정
	public int modifyMinParticipant(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);

	// 최대 인원 수정
	public int modifyMaxParticipant(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);

	// 참고사항 수정
	public int modifyNote(@Param("survey_response_id") String survey_response_id, @Param("moment_id") String moment_id);
	
	// 투표 완료 확인 컬럼 수정
	public int modifyWhetherVote(@Param("vote_id") String vote_id);

	// 설문 완료 확인 컬럼 수정
	public int modifyWhetherSurvey(@Param("survey_id") String survey_id);
	
	// 진행 중인 설문 투표 없는지 확인
	public int checkMomentCompleteCount(@Param("moment_id") String moment_id);
	
}
