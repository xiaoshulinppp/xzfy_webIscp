package com.taiji.user.webwork.action;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import com.opensymphony.xwork.ActionContext;
import com.taiji.core.security.SecurityService;
import com.taiji.core.util.Constants;
import com.taiji.core.webwork.action.BaseAction;
import com.taiji.system.domain.Style;
import com.taiji.user.domain.Role;
import com.taiji.user.domain.User;
import com.taiji.user.service.IUserService;
import com.taiji.user.util.RemoteUser;

/**
 * @author xuelian zhang
 * @since 2005-11-28
 * @version $Revision: 1.0 $
 */
public class LoginAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String frameURL;
	private String username;
	private String password;
	private IUserService userService;
	@SuppressWarnings("unused")
	private static Properties prop;
	private Timer timer;
	private String errorContent = "";
	private Integer userRole = 1;

	private void login() {
	}

	public String loginerror() {
		login();
		addActionError("login.error");
		return SUCCESS;
	}

	public String valierror() {
		login();
		addActionError("valivate.error");
		return SUCCESS;
	}

	public String loginrepeat() {
		login();
		addActionError("repeatLogin.error");
		return SUCCESS;
	}

	public String loginMuiltError() {
		login();
		addActionError("fault.error");
		return SUCCESS;
	}

	public String viewLogin() {
		login();
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	private User appendUserInfo() {
		User user = null;
		if (username == null)
			return user;
		if (username.equals(SecurityService.ADMIN)) {
			user = new User();
			user.setLogName(SecurityService.ADMIN);
			user.setStyle(new Integer(1));
			user.setName(SecurityService.ADMINNAME);
		} else {
			List userList = coreService.findByNamedQuery("findUserByLoginName", username);
			if (userList != null && userList.size() == 1) {
				user = (User) userList.get(0);
			}
		}
		// user = userService.getUser(username);
		return user;
	}

	class RemindTask extends TimerTask {
		@Override
		public void run() {
			User user = appendUserInfo();
			user.setFaultLogin(0);
			userService.update(user);
			timer.cancel(); // Terminate the timer thread
		}
	}

	@Override
	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			User user = appendUserInfo();
			Map userTypeMap = getDictMap("userType");
			int isLoging = 0;
			if (user != null)
				isLoging = userService.saveLogin(user, password, userTypeMap);
			if (isLoging >= 1) {
				return ERROR;
			}
//			//新加
//			ContextUtil.ApplicationSessionList.add(ActionContext.getContext().getSession());
			
			ActionContext.getContext().getSession().put(Constants.USER_LOGIN, user);
			if (null == user) {
				System.err.println("The User Object is Null!");
				System.err.println("Please login!");
				this.errorContent = "error";
				return ERROR;
			}
			Style style = (Style) coreService.getEntityObjectById(Style.class, user.getStyle());
			frameURL = style.getFramePath() + "/index_frame.ftl";
			ActionContext.getContext().getSession().put(Constants.USER_STYLE, style);
			RemoteUser.set(user);
			Iterator<Role> roles = user.getRoles().iterator();
			if (roles.hasNext()) {
				this.userRole = roles.next().getId();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	public String unLogin() {
		try {
			User user = (User) ActionContext.getContext().getSession().get(Constants.USER_LOGIN);
			user.setLoginState(new Integer(0));
			coreService.update(user);
			System.out.println("exist login");
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 登录后台页面 Kerbol 2011-05-25
	 */
	public String gotoBackFrame() {
		// User user = (User)
		// ActionContext.getContext().getSession().get("_USER_LOGIN_");
		Style style = (Style) ActionContext.getContext().getSession().get("_USER_STYLE_");
		this.frameURL = style.getFramePath() + "/index_frame.ftl";
		return "success";
	}

	// Set和Get方法

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {

		this.password = password;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getFrameURL() {
		return frameURL;
	}

	public String getErrorContent() {
		return errorContent;
	}

	public void setErrorContent(String errorContent) {
		this.errorContent = errorContent;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}

}