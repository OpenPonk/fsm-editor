Class {
	#name : 'OPFsmIcons',
	#superclass : 'Object',
	#category : 'OpenPonk-FSM-Icons',
	#package : 'OpenPonk-FSM',
	#tag : 'Icons'
}

{ #category : 'icons' }
OPFsmIcons class >> opFsmDiagramIcon [
	"Answers the diagram icon for FSM."

	^ Form fromBinaryStream: self opFsmDiagramIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmDiagramIconContents [
	"Answers base64 encoded PNG data for the FSM diagram icon."

	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gwRERYhhKBmygAAABl0RVh0Q29tbWVudABD
cmVhdGVkIHdpdGggR0lNUFeBDhcAAABvSURBVDjLzZKxDcAgDAQvzMJMdEzAoGQGlvk0jmRF
iBCRgpeuMfrHxsBOikA1Yuc8Ac1IvYAKyKgds4BiqBfyDJCjmfFWsRrBFTNwGhk4HMuaGmEm
ZPiIb9LKLVqZU7MtNmeUX9VI4c+vvMeqPusCWs8vzPVQRpYAAAAASUVORK5CYII='
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmFinalStateIcon [

	^ Form fromBinaryStream: self opFsmFinalStateIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmFinalStateIconContents [
	"Private - Method generated with the content of the file File @ /home/peter/prog/dynacase/icons/dcFsmFinalState.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gwREQUOTp4aAQAAABl0RVh0Q29tbWVudABD
cmVhdGVkIHdpdGggR0lNUFeBDhcAAAClSURBVDjLrZPBDcMgDEWfes6dndiADTxEtmAHNugE
uTAL19xDLx+JtolSFb70L9a3/bENfMMBESjAIRbFHDeIQAV2IAFeTIpVaU6xSZCABQjAUwyK
JWm2q86rxBXIgIlZsSDNmxPXdW7JduLQuiLNiWvdd1m8Sv4ssignogm37pl75M5FQWvyGpb9
UMCk9cDxYAKGnzA8xOE1Dh/SlFOe8pn++s4v54Jh4eRQWrEAAAAASUVORK5CYII='
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmFlippedTransitionIcon [

	^ Form fromBinaryStream: self opFsmFlippedTransitionIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmFlippedTransitionIconContents [
	"Private - Method generated with the content of the file File @ /home/peter/prog/dynacase/icons/dcFsmTransition.png"

	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAAAGYktHRAD/AP8A/6C9p5MAAAAHdElNRQfeDBERByHXeUXaAAAAGXRFWHRDb21tZW50AENyZWF0ZWQgd2l0aCBHSU1QV4EOFwAAAIxJREFUOE/tk7ENAyEMRT9ZhRKJBSjYiwpWADZjANaggjtbXJorILkmRZ5k2S54km0hxgke8Jr5a35YsLuamyClBCEExxZ0BaLWOpRSw1rLfe+d8wo+YwgB3nvknGGMQWtt6tewQGuNUgqcczw7xTYkIGKM9IrzJ7wFF7QDKeXs1twExDnOrNb8/wJwAD42FpEUsSdQAAAAAElFTkSuQmCC'
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmInitialStateIcon [

	^ Form fromBinaryStream: self opFsmInitialStateIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmInitialStateIconContents [
	"Private - Method generated with the content of the file File @ /home/peter/prog/dynacase/icons/dcFsmInitialState.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gwREQgUBlKdNgAAABl0RVh0Q29tbWVudABD
cmVhdGVkIHdpdGggR0lNUFeBDhcAAAA0SURBVDjLY2AYBYQADxSTBSIZGBj+Q3EkJZpJNoQH
i2YYxvAOE60CjyIvUCUQqRKNIwUAAFRhFQHiIcRQAAAAAElFTkSuQmCC'
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmRegularStateIcon [

	^ Form fromBinaryStream: self opFsmRegularStateIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmRegularStateIconContents [
	"Private - Method generated with the content of the file File @ /home/peter/prog/dynacase/icons/dcFsmRegularState.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gwREQMGFh81tQAAABl0RVh0Q29tbWVudABD
cmVhdGVkIHdpdGggR0lNUFeBDhcAAACSSURBVDjLrdO9DcJADIbhR4QG6QbJEvQZAIpscHuk
YpX02SEFy6SlCY1pgBDy80purE/32WebTxJqdBgiusglM9QY0SOjjMiRG0PzlSYE+YdBDk0z
5VyZp3qvJP3hPFVJern3ltOjLnBDi/vCB464ijGVKyooMRxspMAZjxUtXHDa/Im7jHHzIu2y
yrsc06pzfgKTTTJXZ7zJ7gAAAABJRU5ErkJggg=='
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmTransitionIcon [

	^ Form fromBinaryStream: self opFsmTransitionIconContents base64Decoded asByteArray readStream
]

{ #category : 'icons' }
OPFsmIcons class >> opFsmTransitionIconContents [
	"Private - Method generated with the content of the file File @ /home/peter/prog/dynacase/icons/dcFsmTransition.png"
	^ 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABmJLR0QA/wD/AP+gvaeTAAAA
CXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3gwREQch13lF2gAAABl0RVh0Q29tbWVudABD
cmVhdGVkIHdpdGggR0lNUFeBDhcAAABqSURBVDjLY2AYBcQCRlwSzCQY8p+BgeEdAwPDKUpc
cICBgeEKAwODArKEBQkG/WBgYLBmYGCYwsDA0MDAwNDIwsDA4E+iN/5D2cEMDAyNpHolF2pA
LkyAhQTNdxgYGJ7gixFCQGc0NWMHAKweDmH+UsOrAAAAAElFTkSuQmCC'
]
