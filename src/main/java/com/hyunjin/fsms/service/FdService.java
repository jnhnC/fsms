package com.hyunjin.fsms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyunjin.fsms.repository.FdMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FdService {
	private final FdMapper fdMapper;

	public List<Map<String, Object>> fspFd001S01(Map<String, Object> map) {
		return fdMapper.fspFd001S01(map);
	}

	public List<Map<String, Object>> fspFd002S01(Map<String, Object> map) {
		return fdMapper.fspFd002S01(map);
	}

	public List<Map<String, Object>> fspFd002S02(Map<String, Object> map) {
		return fdMapper.fspFd002S02(map);
	}

	@Transactional
	public Map<String, Object> fspFd002U01(Map<String, Object> map) {
		return fdMapper.fspFd002U01(map);
	}

	@Transactional
	public Map<String, Object> saveFd(Map<String, Object> map) {
		int cnt = Integer.parseInt((String)map.get("trCount"));

		List<Map<String, Object>> results = new ArrayList<>();


	    String[] statuss= (String[]) map.get("status");
	    String[] actSeqs= (String[]) map.get("actSeq");
	    String[] actDts= (String[]) map.get("actDt");
	    String[] actDtInHours= (String[]) map.get("actDtInHour");
	    String[] actDtInMinutes= (String[]) map.get("actDtInMinute");
	    String[] actDtOutHours= (String[]) map.get("actDtOutHour");
	    String[] actDtOutMinutes= (String[]) map.get("actDtOutMinute");
	    String[] actRemarks= (String[]) map.get("actRemark");

		for (int i = 0; i < cnt; i++) {


			String status = "";
			String actSeq = "";
			String actDt = "";
			String actDtInHour = "";
			String actDtInMinute = "";
			String actDtOutHour = "";
			String actDtOutMinute = "";
			String actRemark = "";


			if(statuss.length != 0) {
				status = statuss[i].equals("null") ? "" : statuss[i];
			}

			if(actSeqs.length != 0) {
				actSeq= actSeqs[i].equals("null") ? "" : actSeqs[i];
			}

			if(actDts.length != 0) {
				actDt = actDts[i].equals("null") ? "" : actDts[i];
			}

			if(actDtInHours.length != 0) {
				actDtInHour = actDtInHours[i].equals("null") ? "" : actDtInHours[i];
			}

			if(actDtInMinutes.length != 0) {
				actDtInMinute =actDtInMinutes[i].equals("null") ? "" : actDtInMinutes[i];
			}

			if(actDtOutHours.length != 0) {
				actDtOutHour = actDtOutHours[i].equals("null") ? "" : actDtOutHours[i];
			}


			if(actDtOutMinutes.length != 0) {
				actDtOutMinute = actDtOutMinutes[i].equals("null") ? "": actDtOutMinutes[i];
			}

			if(actRemarks.length != 0) {
				actRemark = actRemarks[i].equals("null") ? "" : actRemarks[i];
			}



			map.put("status", status);
			map.put("actSeq", actSeq);
			map.put("actDtIn", actDt + " " + actDtInHour + ":" + actDtInMinute);
			map.put("actDtOut", actDt + " " + actDtOutHour + ":" + actDtOutMinute);
			map.put("actRemark", actRemark);

			System.out.println(map);
			//#{soNo},#{status},#{actSeq},#{actDtIn},#{actDtOut},#{actRemark},#{empNo}
			Map<String, Object> result = fdMapper.fspFd002U01(map);

			 results.add(result);
		}

		Map<String, Object> result = new HashMap<>();

		for(Map<String, Object> r : results){
			if(r.get("MSG_CD").equals("0")) {
				result.put("MSG_CD", "0");
				break;
			}else {
				result.put("MSG_CD", "1");
			}
		}

		return result;
	}


}
