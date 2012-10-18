metacello
methodElementForClass: aClass isMeta: isMeta selector: selector

	| behavior |
	behavior := isMeta ifTrue: [ aClass class ] ifFalse: [ aClass ].
	^TZMethodElement new
        isMeta: isMeta;
        elementClass: aClass;
        elementClassName: aClass name;
        selector: selector;
        category: (behavior categoryOfSelector: selector asSymbol);
        setSource;
        yourself