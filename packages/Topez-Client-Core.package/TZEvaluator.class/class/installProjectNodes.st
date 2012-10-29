command definition
installProjectNodes
    self rootNode
        addChildNode:
            (TZObjectNode new
                name: 'projects';
                extension: '/';
                elementBlock: [ :projectNode :projectName :absentBlock | 
                            TZObjectNode new
                                name: projectName;
                                extension: '/';
                                elementBlock: [ :elementNode :className :aBlock | 
                                            className = 'classes'
                                                ifFalse: [ self error: 'only classes supported' ].
                                            TZObjectNode new
                                                name: className;
                                                elementBlock: [ :classNode :bName :bBlock | self halt ];
                                                collectionBlock: [ :classNode | 
                                                            classNode topez session
                                                                classesInMetacelloProject:
                                                                    (Metacello image
                                                                        project: classNode parent name;
                                                                        list) asTopezProxy ];
                                                listBlock: [ :classNode | 
                                                            | ar classes |
                                                            ar := classNode topez session
                                                                rawClassesInMetacelloProject:
                                                                    (Metacello image
                                                                        project: classNode parent name;
                                                                        list) asTopezProxy.
                                                            classes := (ar at: 1) , (ar at: 2) keys.
                                                            classes := (classes collect: [ :cl | cl theNonMetaClass ])
                                                                asSet asArray.
                                                            (classes collect: [ :cl | cl name asString ]) sorted ];
                                                yourself ];
                                collectionBlock: [ :elementNode | self halt ];
                                listBlock: [ :classNode | #('classes' 'groups' 'packages' 'projects' 'tests') ];
                                yourself ];
                collectionBlock: [ :projectNode | self halt ];
                listBlock: [ :projectNode | 
                            ((Metacello image
                                project: [ :spec | true ];
                                list) collect: [ :spec | spec name ]) sorted ];
                addBlock: [ :projectNode :projectName :block | self halt ];
                removeBlock: [ :projectNode :projectName | self halt ];
                yourself)