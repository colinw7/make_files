include($$(MAKE_DIR)/qt_app.mk)

QT += opengl

PRE_TARGETDEPS = \
$(LIB_DIR)/libCProcessing.a \
$(LIB_DIR)/libCProcessingCore.a \

INCLUDEPATH += \
$(INC_DIR)/CProcessingCore \
$(INC_DIR)/CMath \
$(INC_DIR)/CThread \
$(INC_DIR)/CUtil \

unix:LIBS += \
-lCProcessing -lCProcessingCore -lCQApp -lCQWindow \
-lCQGLControl -lCGLUtil -lCGLTexture -lCQImageFilter \
-lCQUtil -lCQImage -lCQFont \
-lCSVG -lCSVGRenderer -lCQJavaScript -lCJavaScript -lCJson -lCCSS -lCXML -lCEncode \
-lCImageRenderer2D -lCRenderer2D -lCPath2D \
-lCImagePixelRenderer -lCPixelRenderer -lCSymbol2D -lCPixelClip \
-lCWindow -lCConfig -lCFont -lCImageLib -lCFreeType \
-lCThread -lCFileUtil -lCFile -lCFileParse -lCEnv -lCStrParse \
-lCMath -lCOSUser -lCOSFile -lCOSTime -lCOSRand -lCOSNaN -lCTempFile \
-lCUtil -lCRGBUtil -lCLogBuffer -lCRegExp -lCStrUtil -lCPrintF -lCStrNCase \
-lGLU -lglut -ltre $$IMAGE_LIBS -lpthread -lfreetype
