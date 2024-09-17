/*====================
	IGalleryDAO.java
	- 인터페이스
====================*/

package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface IGalleryDAO
{
	// 갤러리 모든 리스트 출력
	public ArrayList<GalleryDTO> galleryList(@Param("moment_id") String moment_id);
	
	// 모먼트명(단일 값) 찾아오기
	public GalleryDTO getMomentName(@Param("moment_id") String moment_id);
	
	// 갤러리 테이블 모든 레코드 개수 세기
	public int galleryCount();
	
	// 그룹원 아이디 확인
	public String searchMemberId(@Param("user_id") String user_id, @Param("group_id") String group_id);
	
	// 모먼트 참여자 아이디 찾기
	public String getPartiId(@Param("member_id") String member_id, @Param("moment_id") String moment_id);
	
	// 이미 참여 중인 모먼트인지 확인
	public int momentJoinCount(@Param("user_id") String user_id, @Param("moment_id") String moment_id);
	
	// 갤러리 테이블에 데이터 추가
	public int addGallery(@Param("moment_id") String moment_id, @Param("participant_id") String participant_id
						, @Param("file_realname") String file_realname, @Param("file_settingname") String file_settingname
						, @Param("root") String root);
	
	// 특정 갤러리 페이지 정보 조회
	public GalleryDTO myGalleryList(@Param("gallery_id") String gallery_id);
	
	// 내 게시글인지 확인
	public int countMyPicture(@Param("gallery_id") String gallery_id, @Param("participant_id") String participant_id);
	
	// 게시글 삭제할 수 있는 조건인지 확인
	public String PictureDeleteOk(@Param("gallery_id") String gallery_id, @Param("participant_id") String participant_id);

	// 특정 갤러리 페이지 댓글 수 조회
	public int countComment(@Param("gallery_id") String gallery_id);

	// 특정 갤러리 페이지 댓글 내용 조회
	public ArrayList<GalleryDTO> galleryCommentList(@Param("gallery_id") String gallery_id, @Param("member_id") String member_id);

	// 갤러리 댓글 인서트
	public int addGalleryComment(@Param("gallery_id") String gallery_id, @Param("member_id") String member_id, @Param("contents") String contents);
	
	// 저장된 경로, 파일명 확인
	public GalleryDTO getSettingFile(@Param("gallery_id") String gallery_id);
	
	// 갤러리 게시글 삭제 전 모든 댓글 삭제
	public int removeGalleryCommentAll(@Param("gallery_id") String gallery_id);
	
	// 갤러리 게시글 삭제
	public int removeGallery(@Param("gallery_id") String gallery_id);
	
	// 갤러리의 특정 댓글만 삭제
	public int removeGalleryComment(@Param("comment_id") String comment_id);
}
