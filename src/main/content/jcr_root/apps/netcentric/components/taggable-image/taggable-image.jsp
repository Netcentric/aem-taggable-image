<%--
 (C) Copyright 2015 Netcentric AG.

 All rights reserved. This program and the accompanying materials
 are made available under the terms of the Eclipse Public License v1.0
 which accompanies this distribution, and is available at
 http://www.eclipse.org/legal/epl-v10.html
--%><%@ page session="false"
    import="com.day.cq.commons.Doctype,
    com.day.cq.wcm.api.components.DropTarget,
    com.day.cq.wcm.foundation.Image, com.day.cq.wcm.foundation.Placeholder" %><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><script type="text/javascript">
$(document).ready(function(){
    makeTaggable('<%= resource.getPath() %>');
});

</script><%
    Image image = new Image(resource);
    image.setIsInUITouchMode(Placeholder.isAuthoringUIModeTouch(slingRequest));

    //drop target css class = dd prefix + name of the drop target in the edit config
    image.addCssClass(DropTarget.CSS_CLASS_PREFIX + "image");
	image.addCssClass("taggable");
    image.loadStyleData(currentStyle);
    image.setSelector(".img"); // use image script
    image.setDoctype(Doctype.fromRequest(request));
    // add design information if not default (i.e. for reference paras)
    if (!currentDesign.equals(resourceDesign)) {
        image.setSuffix(currentDesign.getId());
    }
    String divId = "cq-image-jsp-" + resource.getPath();
	%><div id="<%= divId %>"><% image.draw(out); %></div><%
    %><cq:text property="jcr:description" placeholder="" tagName="small" escapeXml="true"/>
    
    <%@include file="/libs/foundation/components/image/tracking-js.jsp"%>
