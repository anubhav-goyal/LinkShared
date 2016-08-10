<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="header">
	<g:set var="entityName" value="${message(code: 'linkResource.label', default: 'LinkResourceCO')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

<div class="row">
	<div class="col-md-6">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h5>Create Topic</h5>
			</div>
			<div class="panel-body">

			</div>
		</div>

	</div>
	<div class="col-md-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h5>Link Resource</h5>
			</div>
			<div class="panel-body">
				<g:form class="form-horizontal" method="post" controller="linkResource" action="save">
					<div class="form-group text-center">
						<g:if test="${flash.message}">
							${flash.message}
						</g:if>
					</div>
					<div class="form-group">
						<label for="Url" class="col-sm-2 control-label">URL</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="url" id="url" placeholder="url" required>
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-sm-2 control-label">Description</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="description" id="description" placeholder="Description" required></textarea>
						</div>
					</div>
					<div class="form-group">
						<label for="topic" class="col-sm-2 control-label">Topic</label>
						<div class="col-sm-10">
							<g:select name="topic" from="${topics}" optionKey="id" optionValue="name"/>
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Create</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
