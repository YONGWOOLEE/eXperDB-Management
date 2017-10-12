package com.k4m.dx.tcontrol.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.k4m.dx.tcontrol.admin.dbserverManager.service.DbServerVO;
import com.k4m.dx.tcontrol.common.service.AgentInfoVO;
import com.k4m.dx.tcontrol.common.service.CmmnServerInfoService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("cmmnServerInfoServiceImpl")
public class CmmnServerInfoServiceImpl extends EgovAbstractServiceImpl implements CmmnServerInfoService {

	@Resource(name = "cmmnServerInfoDAO")
	private CmmnServerInfoDAO cmmnServerInfoDAO;
	
	/**
	 * 서버정보 리스트
	 */
	public List<DbServerVO> selectDbServerList(String db_svr_nm) throws Exception {
        return cmmnServerInfoDAO.selectDbServerList(db_svr_nm);
	}

	@Override
	public AgentInfoVO selectAgentInfo(AgentInfoVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (AgentInfoVO) cmmnServerInfoDAO.selectAgentInfo(vo);
	}

	@Override
	public DbServerVO selectServerInfo(DbServerVO vo) throws Exception {
		// TODO Auto-generated method stub
		return (DbServerVO) cmmnServerInfoDAO.selectServerInfo(vo);
	}
	
	
}
