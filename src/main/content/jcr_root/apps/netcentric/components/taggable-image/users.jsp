<%@page session="false"%><%--
 (C) Copyright 2015 Netcentric AG.

 All rights reserved. This program and the accompanying materials
 are made available under the terms of the Eclipse Public License v1.0
 which accompanies this distribution, and is available at
 http://www.eclipse.org/legal/epl-v10.html
--%><%@include file="/libs/foundation/global.jsp"%>
<%@ page contentType="application/json; charset=utf-8" import="
    org.apache.jackrabbit.api.security.user.UserManager,
	org.apache.jackrabbit.api.security.user.Authorizable,
    org.apache.jackrabbit.api.security.user.Query,
    org.apache.jackrabbit.api.security.user.QueryBuilder,
    org.apache.jackrabbit.api.security.user.User,
	org.apache.jackrabbit.api.JackrabbitSession,
	org.apache.sling.jcr.api.SlingRepository,
	javax.jcr.Repository,
	javax.jcr.Session,
	java.util.Iterator"
%>[<%
    final String term = slingRequest.getParameter("term");
	SlingRepository repository = sling.getService(SlingRepository.class);
	Session adminSession = null;
    try {
        adminSession = repository.loginAdministrative(null);
    	final JackrabbitSession js = (JackrabbitSession) adminSession;
    	final UserManager um = js.getUserManager();
    	Iterator<Authorizable> users = um.findAuthorizables(new Query() {
          public  void build(QueryBuilder builder) {
              builder.setCondition(builder.nameMatches(term + "%"));
              builder.setSortOrder("@name", QueryBuilder.Direction.ASCENDING);
              builder.setSelector(User.class);
          }
     	});
    	while (users.hasNext()) {
            Authorizable user = users.next();
            String gn = "";
            String fn = "";
            Value[] names = user.getProperty("profile/givenName");
            if (names != null) gn = names[0].getString();
            names = user.getProperty("profile/familyName");
            if (names != null) fn = names[0].getString();
            %> { "id": "<%= user.getPath() %>", "label": "<%= gn %> <%= fn %>", "value": "<%= gn %> <%= fn %>" }<%
            if (users.hasNext()) %>, <%
        }
    } finally {
        if (adminSession != null) {
            adminSession.logout();
        }
    }
%>]