package com.k4m.dx.tcontrol.server;

import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.dbcp.PoolingDriver;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.k4m.dx.tcontrol.db.DBCPPoolManager;
import com.k4m.dx.tcontrol.db.SqlSessionManager;
import com.k4m.dx.tcontrol.socket.ErrCodeMng;
import com.k4m.dx.tcontrol.socket.ProtocolID;
import com.k4m.dx.tcontrol.socket.SocketCtl;

/**
 * Table List 조회
 *
 * @author 박태혁
 * @see <pre>
 * == 개정이력(Modification Information) ==
 *
 *   수정일       수정자           수정내용
 *  -------     --------    ---------------------------
 *  2017.05.22   박태혁 최초 생성
 * </pre>
 */

public class DxT002 extends SocketCtl{
	
	private static Logger errLogger = LoggerFactory.getLogger("errorToFile");
	
	public DxT002(Socket socket, InputStream is, OutputStream	os) {
		this.client = socket;
		this.is = is;
		this.os = os;
	}

	public void execute(String strDxExCode, JSONObject dbInfoObj, String strSchema) throws Exception {
		byte[] sendBuff = null;
		String strErrCode = "";
		String strErrMsg = "";
		String strSuccessCode = "0";
		
		SqlSessionFactory sqlSessionFactory = null;
		
		JSONObject resDataObj = new JSONObject();
		
		sqlSessionFactory = SqlSessionManager.getInstance();
		
		String poolName = "" + dbInfoObj.get(ProtocolID.SERVER_NAME) + "_" + dbInfoObj.get(ProtocolID.DATABASE_NAME);
		
		Connection connDB = null;
		SqlSession sessDB = null;
		List<Object> selectTableList = new ArrayList<Object>();
		
		try {
			
			SocketExt.setupDriverPool(dbInfoObj, poolName);

			try {
			//DB 컨넥션을 가져온다.
			connDB = DriverManager.getConnection("jdbc:apache:commons:dbcp:" + poolName);
			sessDB = sqlSessionFactory.openSession(connDB);
			
			} catch(Exception e) {
				strErrCode += ErrCodeMng.Err001;
				strErrMsg += ErrCodeMng.Err001_Msg + " " + e.toString();
				strSuccessCode = "1";
			}
		
			HashMap<String, String> hp = new HashMap<String, String>();
			hp.put("dbname", strSchema);
			
			selectTableList = sessDB.selectList("app.selectTableList", hp);
			
			
			JSONObject outputObj = ResultJSON(selectTableList, strDxExCode, strSuccessCode, strErrCode, strErrMsg);
	        
	        sendBuff = outputObj.toString().getBytes();
	        send(4, sendBuff);

			
		} catch (Exception e) {
			errLogger.error("DxT001 {} ", e.toString());
		} finally {
			sessDB.close();
		}	        


	}
}
