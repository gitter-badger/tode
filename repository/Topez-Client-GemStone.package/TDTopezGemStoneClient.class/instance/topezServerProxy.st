as yet unclassified
topezServerProxy
	topezServerProxy
		ifNil: [ 
			| stonString transcriptOopType resultArray topezServerOop topezClientOopType |
			[ stonString := self session executeStringExpectingStringNB: self todeServerCreationString envId: self environmentId ]
				on: GsErrorNotification
				do: [ :firstEx | 
					"try again with no options, in case using old version of tode ... eventually get rid of this"
					[ 
					stonString := self session
						executeStringExpectingStringNB: (self todeServerCreationStringWithOptions: false)
						envId: self environmentId ]
						on: GsErrorNotification
						do: [ :ex | self error: 'Unable to log into server:' , ex description ] ].
			resultArray := STON fromString: stonString.
			topezServerOop := resultArray at: 1.
			topezClientOopType := self session asOopType: (resultArray at: 3).
			topezServerProxy := self session asOopType: topezServerOop.
			(resultArray at: 2)
				ifNotNil: [ :transcriptOop | 
					transcriptOopType := self session asOopType: transcriptOop.
					self session clientForwarderCache at: transcriptOopType put: Transcript ].
			self session clientForwarderCache at: topezClientOopType put: self.
			self session rawReceiverNB: topezServerProxy perform: #authorInitials: withArgs: {(Author fullName)}.
			self sessionDescription backupDirectory isEmpty not
				ifTrue: [ 
					[ 
					self session
						rawReceiverNB: topezServerProxy
						perform: #backupDirectory:
						withArgs: {(self sessionDescription backupDirectory)} ]
						on: Error
						do: [ :ignored |  ] ].
			TZGemStoneProxyBehavior new
				topez: self;
				allGlobalNames;
				yourself ].
	^ topezServerProxy