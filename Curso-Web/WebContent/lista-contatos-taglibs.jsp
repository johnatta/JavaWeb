<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista Contatos</title>
</head>
<body>
	<c:url value="cabecalho.jsp" var="pag"/>
	<c:import url="${pag}"/>

	<table border="1">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email</th>
				<th>Endereco</th>
				<th>Data Nascimento</th>
			</tr>
		</thead>
		<tbody>
			<!-- percorre contatos montando as linhas da tabela -->
			<c:forEach var="contato" items="${contatos}" varStatus="id">
				<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff' }">
					<td>${contato.nome }</td>

					<td><c:if test="${not empty contato.email }">
							<a href="mailto:${contato.email}">${contato.email }</a>
						</c:if> <c:if test="${empty contato.email }">
							Email nao informado.
						</c:if></td>
					<td>${contato.endereco }</td>
					<td>
						<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy" />
					<td>
						<a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
					</td>
					<td>
						<a href="mvc?logica=MostraContatoLogic&id=${contato.id}">Alterar</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:import url="rodape.jsp"></c:import>
</body>
</html>