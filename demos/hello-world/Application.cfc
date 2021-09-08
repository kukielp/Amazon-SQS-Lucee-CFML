component
	output = false
	hint = "I define the application settings and event handlers."
	{

	// Configure the application settings.
	this.name = "AwsSqsHelloWorld";
	this.applicationTimeout = createTimeSpan( 0, 1, 0, 0 );
	this.sessionManagement = false;
	this.setClientCookies = false;

	this.mappings = {
		"/vendor": "../../vendor"
	};

	// ---
	// LIFE-CYCLE METHODS.
	// ---

	/**
	* I get called once when the application is being initialized.
	*/
	public void function onApplicationStart() {

		var config = deserializeJson( fileRead( "./config.json" ) );

		application.sqsClient = new SqsClient(
			classLoader = new AwsClassLoader(),
			accessID = config.aws.accessID,
			secretKey = config.aws.secretKey,
			region = config.aws.region,
			queueName = config.aws.queue,
			defaultWaitTime = 20,
			defaultVisibilityTimeout = 60
		);

	}


	/**
	* I get called once when the request is being initialized.
	*/
	public void function onRequestStart() {

		// If the INIT flag is defined, restart the application in order to refresh the
		// in-memory cache of components.
		if ( url.keyExists( "init" ) ) {

			applicationStop();
			location( url = cgi.script_name, addToken = false );

		}

	}

}
