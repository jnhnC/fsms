package com.hyunjin.fsms.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@ToString(of = {"empNo", "empNm"})
public class Haa011t {

	private String empNo;
	private String empNm;


}
