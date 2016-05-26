local ffi = require "ffi"
local ffi_cdef = ffi.cdef
local ffi_load = ffi.load

ffi_cdef[[
typedef unsigned long HPDF_STATUS;
typedef float HPDF_REAL;
typedef signed int HPDF_INT;
typedef unsigned int HPDF_UINT;
typedef signed int HPDF_BOOL;
typedef void *HPDF_HANDLE;
typedef HPDF_HANDLE HPDF_Doc;
typedef HPDF_HANDLE HPDF_Page;
typedef HPDF_HANDLE HPDF_Pages;
typedef HPDF_HANDLE HPDF_Stream;
typedef HPDF_HANDLE HPDF_Image;
typedef HPDF_HANDLE HPDF_Font;
typedef HPDF_HANDLE HPDF_Outline;
typedef HPDF_HANDLE HPDF_Encoder;
typedef HPDF_HANDLE HPDF_3DMeasure;
typedef HPDF_HANDLE HPDF_ExData;
typedef HPDF_HANDLE HPDF_Destination;
typedef HPDF_HANDLE HPDF_XObject;
typedef HPDF_HANDLE HPDF_Annotation;
typedef HPDF_HANDLE HPDF_ExtGState;
typedef HPDF_HANDLE HPDF_FontDef;
typedef HPDF_HANDLE HPDF_U3D;
typedef HPDF_HANDLE HPDF_JavaScript;
typedef HPDF_HANDLE HPDF_Error;
typedef HPDF_HANDLE HPDF_MMgr;
typedef HPDF_HANDLE HPDF_Dict;
typedef HPDF_HANDLE HPDF_EmbeddedFile;
typedef HPDF_HANDLE HPDF_OutputIntent;
typedef HPDF_HANDLE HPDF_Xref;
typedef void (*HPDF_Error_Handler) (HPDF_STATUS error_no, HPDF_STATUS detail_no, void *user_data);
typedef enum _HPDF_TextAlignment {
    HPDF_TALIGN_LEFT = 0,
    HPDF_TALIGN_RIGHT,
    HPDF_TALIGN_CENTER,
    HPDF_TALIGN_JUSTIFY
} HPDF_TextAlignment;
typedef enum _HPDF_TextRenderingMode {
    HPDF_FILL = 0,
    HPDF_STROKE,
    HPDF_FILL_THEN_STROKE,
    HPDF_INVISIBLE,
    HPDF_FILL_CLIPPING,
    HPDF_STROKE_CLIPPING,
    HPDF_FILL_STROKE_CLIPPING,
    HPDF_CLIPPING,
    HPDF_RENDERING_MODE_EOF
} HPDF_TextRenderingMode;
typedef enum _HPDF_EncoderType {
    HPDF_ENCODER_TYPE_SINGLE_BYTE,
    HPDF_ENCODER_TYPE_DOUBLE_BYTE,
    HPDF_ENCODER_TYPE_UNINITIALIZED,
    HPDF_ENCODER_UNKNOWN
} HPDF_EncoderType;
typedef enum _HPDF_WritingMode {
    HPDF_WMODE_HORIZONTAL = 0,
    HPDF_WMODE_VERTICAL,
    HPDF_WMODE_EOF
} HPDF_WritingMode;
typedef enum _HPDF_PageLayout {
    HPDF_PAGE_LAYOUT_SINGLE = 0,
    HPDF_PAGE_LAYOUT_ONE_COLUMN,
    HPDF_PAGE_LAYOUT_TWO_COLUMN_LEFT,
    HPDF_PAGE_LAYOUT_TWO_COLUMN_RIGHT,
    HPDF_PAGE_LAYOUT_TWO_PAGE_LEFT,
    HPDF_PAGE_LAYOUT_TWO_PAGE_RIGHT,
    HPDF_PAGE_LAYOUT_EOF
} HPDF_PageLayout;
typedef enum _HPDF_PageMode {
    HPDF_PAGE_MODE_USE_NONE = 0,
    HPDF_PAGE_MODE_USE_OUTLINE,
    HPDF_PAGE_MODE_USE_THUMBS,
    HPDF_PAGE_MODE_FULL_SCREEN,
    HPDF_PAGE_MODE_EOF
} HPDF_PageMode;
typedef enum _HPDF_InfoType {
    HPDF_INFO_CREATION_DATE = 0,
    HPDF_INFO_MOD_DATE,
    HPDF_INFO_AUTHOR,
    HPDF_INFO_CREATOR,
    HPDF_INFO_PRODUCER,
    HPDF_INFO_TITLE,
    HPDF_INFO_SUBJECT,
    HPDF_INFO_KEYWORDS,
    HPDF_INFO_TRAPPED,
    HPDF_INFO_GTS_PDFX,
    HPDF_INFO_EOF
} HPDF_InfoType;
typedef struct _HPDF_Date {
    HPDF_INT    year;
    HPDF_INT    month;
    HPDF_INT    day;
    HPDF_INT    hour;
    HPDF_INT    minutes;
    HPDF_INT    seconds;
    char        ind;
    HPDF_INT    off_hour;
    HPDF_INT    off_minutes;
} HPDF_Date;
        HPDF_Doc HPDF_New(HPDF_Error_Handler user_error_fn, void *user_data);
            void HPDF_Free(HPDF_Doc pdf);
     HPDF_STATUS HPDF_SaveToFile(HPDF_Doc pdf, const char *file_name);
       HPDF_Page HPDF_AddPage(HPDF_Doc pdf);
       HPDF_Page HPDF_InsertPage(HPDF_Doc pdf, HPDF_Page target);
       HPDF_Font HPDF_GetFont(HPDF_Doc pdf, const char *font_name, const char *encoding_name);
       HPDF_Page HPDF_GetCurrentPage(HPDF_Doc pdf);
 HPDF_PageLayout HPDF_GetPageLayout(HPDF_Doc pdf);
     HPDF_STATUS HPDF_SetPageLayout(HPDF_Doc pdf, HPDF_PageLayout layout);
   HPDF_PageMode HPDF_GetPageMode(HPDF_Doc pdf);
     HPDF_STATUS HPDF_SetPageMode(HPDF_Doc pdf, HPDF_PageMode mode);
     const char* HPDF_GetInfoAttr(HPDF_Doc pdf, HPDF_InfoType type);
     HPDF_STATUS HPDF_SetInfoAttr(HPDF_Doc pdf, HPDF_InfoType type, const char *value);
     HPDF_STATUS HPDF_SetInfoDateAttr(HPDF_Doc pdf, HPDF_InfoType type, HPDF_Date value);
     HPDF_STATUS HPDF_SetPermission(HPDF_Doc pdf, HPDF_UINT permission);
     HPDF_STATUS HPDF_SetCompressionMode(HPDF_Doc pdf, HPDF_UINT mode);
     HPDF_STATUS HPDF_Page_GSave(HPDF_Page page);
     HPDF_STATUS HPDF_Page_GRestore(HPDF_Page page);
     HPDF_STATUS HPDF_Page_MoveTo(HPDF_Page page, HPDF_REAL x, HPDF_REAL y);
     HPDF_STATUS HPDF_Page_MoveToNextLine(HPDF_Page page);
     HPDF_STATUS HPDF_Page_BeginText(HPDF_Page page);
     HPDF_STATUS HPDF_Page_EndText(HPDF_Page page);
     HPDF_STATUS HPDF_Page_TextOut(HPDF_Page page, HPDF_REAL xpos, HPDF_REAL ypos, const char *text);
     HPDF_STATUS HPDF_Page_TextRect (HPDF_Page page, HPDF_REAL left, HPDF_REAL top, HPDF_REAL right, HPDF_REAL bottom, const char *text, HPDF_TextAlignment align, HPDF_UINT *len);
     HPDF_STATUS HPDF_Page_ShowText(HPDF_Page page, const char *text);
     HPDF_STATUS HPDF_Page_ShowTextNextLine(HPDF_Page page, const char *text);
     HPDF_STATUS HPDF_Page_ShowTextNextLineEx(HPDF_Page page, HPDF_REAL word_space, HPDF_REAL char_space, const char *text);
     HPDF_STATUS HPDF_Page_MoveTextPos(HPDF_Page page, HPDF_REAL x, HPDF_REAL y);
     HPDF_STATUS HPDF_Page_Stroke(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetFontAndSize(HPDF_Page page, HPDF_Font font, HPDF_REAL size);
     HPDF_STATUS HPDF_Page_Circle(HPDF_Page page, HPDF_REAL x, HPDF_REAL y, HPDF_REAL radius);
     HPDF_STATUS HPDF_Page_Rectangle(HPDF_Page page, HPDF_REAL x, HPDF_REAL y, HPDF_REAL width, HPDF_REAL height);
     HPDF_STATUS HPDF_Page_Arc(HPDF_Page page, HPDF_REAL x, HPDF_REAL y, HPDF_REAL radius, HPDF_REAL ang1, HPDF_REAL ang2);
     HPDF_STATUS HPDF_Page_Ellipse(HPDF_Page page, HPDF_REAL x, HPDF_REAL y, HPDF_REAL x_radius, HPDF_REAL y_radius);
     HPDF_STATUS HPDF_Page_LineTo(HPDF_Page page, HPDF_REAL x, HPDF_REAL y);
       HPDF_REAL HPDF_Page_GetWidth(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetWidth(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetHeight(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetHeight(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetCharSpace(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetCharSpace(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetWordSpace(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetWordSpace(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetHorizontalScalling(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetHorizontalScalling(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetTextLeading(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetTextLeading(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetTextRenderingMode(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetTextRenderingMode(HPDF_Page page, HPDF_TextRenderingMode mode);
       HPDF_REAL HPDF_Page_GetTextRise(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetTextRise(HPDF_Page page, HPDF_REAL value);
       HPDF_REAL HPDF_Page_GetGrayFill(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetGrayFill(HPDF_Page page, HPDF_REAL gray);
       HPDF_REAL HPDF_Page_GetGrayStroke(HPDF_Page page);
     HPDF_STATUS HPDF_Page_SetGrayStroke(HPDF_Page page, HPDF_REAL gray);
     HPDF_STATUS HPDF_Page_DrawImage(HPDF_Page page, HPDF_Image image, HPDF_REAL x, HPDF_REAL y, HPDF_REAL width, HPDF_REAL height);
     HPDF_STATUS HPDF_UseJPEncodings(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseKREncodings(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseCNSEncodings(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseCNTEncodings(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseUTFEncodings(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseJPFonts(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseKRFonts(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseCNSFonts(HPDF_Doc pdf);
     HPDF_STATUS HPDF_UseCNTFonts(HPDF_Doc pdf);
     const char* HPDF_LoadTTFontFromFile (HPDF_Doc pdf, const char *file_name, HPDF_BOOL embedding);
     const char* HPDF_Font_GetFontName(HPDF_Font font);
     const char* HPDF_Font_GetEncodingName(HPDF_Font font);
        HPDF_INT HPDF_Font_GetAscent(HPDF_Font font);
        HPDF_INT HPDF_Font_GetDescent(HPDF_Font font);
      HPDF_Image HPDF_LoadPngImageFromFile(HPDF_Doc pdf, const char *filename);
      HPDF_Image HPDF_LoadJpegImageFromFile(HPDF_Doc pdf, const char  *filename);
       HPDF_UINT HPDF_Image_GetWidth(HPDF_Image image);
       HPDF_UINT HPDF_Image_GetHeight(HPDF_Image image);
     const char* HPDF_Image_GetColorSpace(HPDF_Image image);
       HPDF_UINT HPDF_Image_GetBitsPerComponent(HPDF_Image image);
    HPDF_Encoder HPDF_GetEncoder(HPDF_Doc pdf, const char  *encoding_name);
    HPDF_Encoder HPDF_GetCurrentEncoder(HPDF_Doc pdf);
     HPDF_STATUS HPDF_SetCurrentEncoder(HPDF_Doc pdf, const char *encoding_name);
HPDF_EncoderType HPDF_Encoder_GetType(HPDF_Encoder encoder);
HPDF_WritingMode HPDF_Encoder_GetWritingMode(HPDF_Encoder encoder);

]]

--[[
Basic Functions:
HPDF_NewDoc()
HPDF_FreeDoc()
HPDF_SaveToStream()
HPDF_GetStreamSize()
HPDF_ReadFromStream()
HPDF_ResetStream()
HPDF_HasDoc()
HPDF_SetErrorHandler()
HPDF_GetError()
HPDF_ResetError()
Pages Handling:
HPDF_SetPagesConfiguration()
HPDF_SetOpenAction()
Font Handling:
HPDF_AddPageLabel()
HPDF_LoadType1FontFromFile()
HPDF_LoadTTFontFromFile2()
Other Functions:
HPDF_CreateOutline()
HPDF_LoadPngImageFromFile2()
HPDF_LoadRawImageFromFile()
HPDF_LoadRawImageFromMem()
HPDF_LoadPngImageFromMem()
HPDF_LoadJpegImageFromMem()
HPDF_SetPassword()
HPDF_SetEncryptionMode()
Page:
HPDF_Page_SetSize()
HPDF_Page_SetRotate()
HPDF_Page_CreateDestination()
HPDF_Page_CreateTextAnnot()
HPDF_Page_CreateLinkAnnot()
HPDF_Page_CreateURILinkAnnot()
HPDF_Page_TextWidth()
HPDF_Page_MeasureText()
HPDF_Page_GetGMode()
HPDF_Page_GetCurrentPos()
HPDF_Page_GetCurrentTextPos()
HPDF_Page_GetCurrentFont()
HPDF_Page_GetCurrentFontSize()
HPDF_Page_GetTransMatrix()
HPDF_Page_GetLineWidth()
HPDF_Page_GetLineCap()
HPDF_Page_GetLineJoin()
HPDF_Page_GetMiterLimit()
HPDF_Page_GetDash()
HPDF_Page_GetFlat()
HPDF_Page_GetRGBFill()
HPDF_Page_GetRGBStroke()
HPDF_Page_GetCMYKFill()
HPDF_Page_GetCMYKStroke()
HPDF_Page_GetStrokingColorSpace()
HPDF_Page_GetFillingColorSpace()
HPDF_Page_GetTextMatrix()
HPDF_Page_GetGStateDepth()
HPDF_Page_SetSlideShow()
HPDF_Page_New_Content_Stream()
HPDF_Page_Insert_Shared_Content_Stream()
Graphics:
HPDF_Page_Clip()
HPDF_Page_ClosePath()
HPDF_Page_ClosePathStroke()
HPDF_Page_ClosePathEofillStroke()
HPDF_Page_ClosePathFillStroke()
HPDF_Page_Concat()
HPDF_Page_CurveTo()
HPDF_Page_CurveTo2()
HPDF_Page_CurveTo3()
HPDF_Page_EndPath()
HPDF_Page_Eoclip()
HPDF_Page_Eofill()
HPDF_Page_EofillStroke()
HPDF_Page_ExecuteXObject()
HPDF_Page_Fill()
HPDF_Page_FillStroke()
HPDF_Page_MoveTextPos2()
HPDF_Page_SetCMYKFill()
HPDF_Page_SetCMYKStroke()
HPDF_Page_SetDash()
HPDF_Page_SetExtGState()
HPDF_Page_SetLineCap()
HPDF_Page_SetLineJoin()
HPDF_Page_SetLineWidth()
HPDF_Page_SetMiterLimit()
HPDF_Page_SetRGBFill()
HPDF_Page_SetRGBStroke()
HPDF_Page_SetTextMatrix()
Fonts:
HPDF_Font_GetUnicodeWidth()
HPDF_Font_GetBBox()
HPDF_Font_GetXHeight()
HPDF_Font_GetCapHeight()
HPDF_Font_TextWidth()
HPDF_Font_MeasureText()
Encodings:
HPDF_Encoder_GetByteType()
HPDF_Encoder_GetUnicode()
Annotations:
HPDF_LinkAnnot_SetHighlightMode()
HPDF_LinkAnnot_SetBorderStyle()
HPDF_TextAnnot_SetIcon()
HPDF_TextAnnot_SetOpened()
HPDF_Annotation_SetBorderStyle()
Outline:
HPDF_Outline_SetOpened()
HPDF_Outline_SetDestination()
Destination:
HPDF_Destination_SetXYZ()
HPDF_Destination_SetFit()
HPDF_Destination_SetFitH()
HPDF_Destination_SetFitV()
HPDF_Destination_SetFitR()
HPDF_Destination_SetFitB()
HPDF_Destination_SetFitBH()
HPDF_Destination_SetFitBV()
Image:
HPDF_Image_GetSize()
HPDF_Image_SetColorMask()
HPDF_Image_SetMaskImage()
-- ]]

return ffi_load "hpdf"