<cfscript>

	param name="form.messageText" type="string" default="";

	if ( form.messageText.len() ) {

		application.sqsClient.sendMessage(
			serializeJson({
				text: messageText
			}),
			{
				version: 1,
				createdAt: getTickCount()
			}
		);

	}

</cfscript>
<cfoutput>

	<!doctype html>
	<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>
			Producing Amazon SQS Messages In Lucee CFML 5.3.8.201 - App Runner
		</title>
		<style type="text/css">
			input, button { font-size: 100% ; }
		</style>
	</head>
	<body>

		<h1>
			Producing Amazon SQS Messages In Lucee CFML 5.3.8.201
		</h1>

		<form method="post" action="./produce.cfm">
			<input
				type="text"
				name="messageText"
				size="40"
				autocomplete="off"
			/>
			<button type="submit">
				Send Message
			</button>
		</form>
	
	</body>
	</html>

</cfoutput>
