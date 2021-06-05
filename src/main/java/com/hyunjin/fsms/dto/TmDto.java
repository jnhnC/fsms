package com.hyunjin.fsms.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TmDto {

	private String bpCd;
	private String majorCd;
	private String startDate ;
	private String endDate ;

	private String soNo        ;
	private String orderDt1    ;
	private String orderDt     ;
	private String ownNm       ;
	private String poStatus    ;
	private String poStatusNm  ;
	private String dlvyNm      ;
	private String poBpCd      ;
	private String soType      ;
	private String mBoss       ;
	private String cfmFlag     ;

}
