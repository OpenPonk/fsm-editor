initialization
initialize
	recognizer := OPFsmRecognizer new.
	self watchRecognizer: recognizer.
	super initialize