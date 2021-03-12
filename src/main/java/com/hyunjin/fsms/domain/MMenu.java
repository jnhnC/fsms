package com.hyunjin.fsms.domain;

import org.springframework.data.annotation.Id;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@ToString
public class MMenu {

	@Id
	private String menuId;

	private String menuDiv;
	private String pamenuId;
	private String menuName;
	private String description;
	private String prgmId;
	private String prgmFullPath;
	private String prgmPath;
	private String prgmFileName;
	private String menuOrdr;
	private String remark;
	private String usedYn;
	private String delYn;
	private String regDate;
	private String regUser;
	private String updateDate;
	private String updateUser;


}