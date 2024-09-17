package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IGroupDAO
{

   // 그룹 수 확인
   public int count();
   
   // 그룹 리스트 확인
   public ArrayList<GroupDTO> list();
   
   // 특정 그룹의 그룹원 수 확인(그룹 총원)
   public String groupMemberCount(String group_id);
   
   // (임의) 다음 그룹 생성 코드 가져오기
   public String nextGTId();
   
   // 그룹 생성 신청 데이터 입력(insert)
   public int creationAdd(GroupDTO dto);
   
   // 가개설 그룹 리스트 확인
   public ArrayList<GroupDTO> creationList();
   
   // 가개설 그룹 수 확인
   public int creationCount();
   
   // 해당 그룹 그룹신청서 질문 가져오기
   public ArrayList<GroupDTO> questionForm(String group_id);
   
   // 다음 그룹 매치 코드 가져오기
   public String nextGMId();
   
   // 그룹 매치 데이터 입력(insert)
   public int matchAdd(GroupDTO dto);
   
   // 다음 그룹 가입 코드 가져오기
   public String nextSUId();
   
   // 그룹 자발 가입 데이터 입력(insert)
   public int signupAdd(GroupDTO dto);
   
   // 그룹 신청서 응답 데이터 입력(insert);
   public int answerAdd(GroupDTO dto);
   
   // 다음 응답 코드 가져오기
   public String nextSAId();
   
   // 해당그룹회원 특정매칭코드 가져오기
   public String GroupMemberGMId(GroupInviteDTO dto);
   
   // 그룹 초기 초대 데이터 입력(insert)
   public int preinviteAdd(GroupInviteDTO dto);
   
   // 그룹 초대 합류 데이터 입력(insert)
   public int inviteAdd(GroupInviteDTO dto);
   
   // 그룹 매치 아이디로 그룹 아이디 조회
   public String searchGRId(String gmId);
   
   // 매니저 수 확인
   public int managerCount(String group_id);
   
   // 매니저 리스트 확인
   public ArrayList<GroupDTO> managerList(String group_id);
   
   // 일반 회원 리스트 확인
   public ArrayList<GroupDTO> generalMemberList(String group_id);
   
   // 인포 모먼트 가장 많은 그룹 아이디 조회
   public GroupDTO activeGroupId();

   // 특정 그룹 정보 조회
   public GroupDTO groupInformation(String group_id);
		
   // 최근 일주일 이내에 생성된 그룹 조회
   public ArrayList<GroupDTO> recentList();
		
   // 그룹원이 제일 많은 그룹 아이디 조회
   public GroupDTO largeGroupId();
		
   // 특정 그룹명 COUNT 조회
   public int groupNameCount(String name);
		
   // 그룹명 검색 결과 조회
   public ArrayList<GroupDTO> searchGroupResult(String name);
		
   // 특정 회원의 가개설 그룹 COUNT 조회
   public int creationGroupCount(String user_id);
   
   // 참가인원이 가장 많았던 모먼트
   public ArrayList<MomentDTO> mostParticipantsMoment(String group_id);
   
   // 가장 최근에 진행됐던 모먼트
   public ArrayList<MomentDTO> mostRecentMoment(String group_id);
   
   // 가장 가까운 일시에 진행될 모먼트
   public ArrayList<MomentDTO> earliestMomentProceed(String group_id);
   
   // 최근에 생성된 모먼트들(일주일)
   public ArrayList<MomentDTO> createdMomentLastweek(String group_id);
   
   // 하나의 USER_ID로 속한 그룹의 MATCH_ID 조회
   public ArrayList<GroupDTO> webUserMatchId(String user_id);
   
   // 그룹의 해당 공지사항 ID와 TITLE 확인
   public ArrayList<AnnouncementDTO> checkAnnTitle(String group_id);
  
   // 그룹의 해당 공지사항 CONTENT 확인
   public String checkAnnContent(@Param(value = "group_id") String group_id, @Param(value = "ann_id") String ann_id);
   
   // 인포 모먼트 일시, 이름, 장소 조회
   public ArrayList<GroupMomentDTO> checkMomentDNP(String group_id);

   // 그룹 생성자의 그룹 생성 코드 조회(개설 초대 위함) USER_ID 이용
   public String creationGroupId(@Param("user_id") String user_id);
   
   // 그룹 생성자 ID 조회
   public GroupDTO groupConstructor(@Param("user_id") String user_id, @Param("creation_id") String creation_id);
   
   // 초기 초대 테이블 INSERT
   public int preInviteAdd(GroupInviteDTO dto);
   
   // 그룹 생성자의 그룹 생성 코드 조회(개설 초대 위함) MATCH_ID 이용
   public String creationGroupIdmatch(@Param("outgoing_id") String match_id);
   
   // 다음 그룹 코드 가져오기
   public String nextGRId();
   
   // TBL_GROUP INSERT
   public int groupAdd(GroupDTO dto);
   
   // 가개설 그룹원 COUNT 확정 그룹으로 넘기기 위함
   public int creationGroupMemberCount(String creation_id);
  
   // 초대 합류 관련 초대 거절을 누른 사용자인지 확인
   public int inviteRefuseCount(GroupDTO dto);
   
   // 초기 초대 합류 관련 수락/거절을 누른 사용자인지 확인
   public int preInviteResponseCount(GroupDTO dto);
   
   // 그룹 생성 코드로 그룹 코드 조회 (확정 그룹이 되면 GR_MATCH UPDATE 위함)
   public String searchGroupId(GroupDTO dto);
   
   // 확정 그룹이 되면 그룹 매치 GROUP_ID UPDATE
   public int groupIdUpdate(GroupDTO dto);
   
   // 특정 그룹의 가입 신청서 응답 가져오기
   public ArrayList<GroupDTO> signupAnswers(String group_id);
   
   // 특정 모먼트명 COUNT 조회
   public int momentNameCount(@Param("name") String name, @Param("group_id") String group_id);
   
   // 모먼트명 검색 결과 조회
   public ArrayList<MomentDTO> searchMomentResult(@Param("name") String name, @Param("group_id") String group_id);
   
   // 해당 그룹의 그룹명 조회
   public String searchGroupName(String group_id);
   
}
