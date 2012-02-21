<%
helper = request.get('helper')
%>
<h2>忘記密碼</h2>
<form action="${response.encodeURL('/login/password_save.groovy')}" method="post" class="form-password">
    <input type="hidden" name="module" value="password" />
	<table class="form-table" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" class="formDesc"><b>請填寫以下資料</b></td>
		</tr>
		<tr>
			<th>電子郵件信箱:</th>
			<td>
				<input type="text" name="email" class="input-text" value="${helper.fetch('email', '')}" title="輸入您的電子郵件信箱。" />
            </td>
		</tr>
		<tr>
		    <th>驗證碼:</th>
		    <td>
		        ${helper.attr('reCaptcha')}
		    </td>
		</tr>
        <% if (helper.attr('password_errormsg') != null) { %>
        <tr>
            <td colspan="2">
                <div class="errormsg">${helper.attr('password_errormsg')}</div>
            </td>
		</tr>
        <% } %>
		<tr>
			<td colspan="2" align="center" class="center">
				<button class="fancy-button" title="重新設定密碼">重新設定密碼</button>
				<a href="index.groovy" class="fancy-button-gray">取消</a>
			</td>
		</tr>
    </table>
</form>