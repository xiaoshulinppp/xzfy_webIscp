<#assign showState = "false">
<#if opName == "view">
  <#assign showState="true">
</#if>
<table width="98%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
    <tr>
      <th class="thFormNormal"></th>
      <th class="thFormNormal"></th>
      </tr>
   <tr class="trwhite">
      <td class ="tdFormLeft">名称</td>
      <td class="tdFormRight"><@ww.textfield  name="'org.name'"  cssClass ="'inputTextNormal'" disabled ="'${showState}'"  required = "'true'" theme="simple"/><font color=red>**</font></td>
   </tr>
    <tr class="trcolor">
      <td class ="tdFormLeft">编码</td>
      <td class="tdFormRight"><@ww.textfield name="'org.bm'" cssClass="'inputTextNormal'" tabindex="'2'"    disabled ="'${showState}'" theme="simple" /><font color=red>**</font></td>
   </tr> 
     <tr class="trwhite">
        <td class="tdFormleft">当前状态</td>
      <td class="tdFormRight"><@ww.select name="'org.state'" list="getDictMap('state')" cssClass="'selectStyleNormal'" disabled ="'${showState}'" theme ="simple" value="1" /><font color=red>**</font></td>
   </tr> 
 </table>