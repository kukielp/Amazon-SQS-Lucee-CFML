<cfscript>

	param name="url.poll" type="boolean" default="false";

	if ( url.poll ) {

		// With a waitTime of 20-seconds, this request is going to BLOCK-AND-WAIT for
		// a successful message response for up-to 20-seconds. The response may come back
		// as an empty array; or, it may contains a max of "maxNumberOfMessages" items.
		messages = application.sqsClient.receiveMessages(
			maxNumberOfMessages = 3,
			waitTime = 20,
			visibilityTimeout = 60
		);

		for ( message in messages ) {

			application.messages.prepend( message );
			// Now that we've stored the message locally, delete it from the queue.
			application.sqsClient.deleteMessage( message.receiptHandle );

		}

	} else {

		application.messages = [];

	}

</cfscript>
<cfoutput>

	<!doctype html>
	<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>
			Consuming Amazon SQS Messages In Lucee CFML 5.3.8.201
		</title>

		<!---
			For the purposes of this demo, while polling for new messages on the queue,
			we need to keep refreshing the page in order to engage the long-polling of
			the Amazon SDK Java client.
		--->
		<cfif url.poll>
			<meta http-equiv="refresh" content="2" />
		</cfif>
	</head>
	<body>

		<h1>
			Consuming Amazon SQS Messages In Lucee CFML 5.3.8.201 - AWS AppRunner
		</h1>

		<cfif url.poll>

			<p>
				<a href="./consume.cfm?poll=false">
					Stop polling
				</a>
			</p>

			<!---
				NOTE: I'm hiding the receiptHandle in the output since it is quite long
				(a max of 1,024 characters) and breaks the layout of the demo page.
			--->
			<cfdump
				label="Messages"
				var="#application.messages#"
				hide="receiptHandle"
			/>

		<cfelse>

			<p>
				<a href="./consume.cfm?poll=true">
					Poll for messages
				</a>
			</p>

		</cfif>

	</body>
	</html>

</cfoutput>
