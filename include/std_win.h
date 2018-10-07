#ifndef STD_WIN_H
#define STD_WIN_H

#include <std_os.h>

#ifdef OS_UNIX

#define MAX_PATH 256

#define WINAPI
#define CALLBACK

#define LRESULT long

#define HORZRES    1
#define VERTRES    2
#define PLANES     3
#define RASTERCAPS 4
#define BITSPIXEL  5

#define OPAQUE      1
#define TRANSPARENT 2

#define BFFM_INITIALIZED  1
#define BFFM_SETSELECTION 2

#define BIF_RETURNONLYFSDIRS 1

#define BS_PUSHBUTTON  1
#define BS_GROUPBOX    2
#define BS_CHECKBOX    3
#define BS_RADIOBUTTON 4

#define BST_CHECKED   1
#define BST_UNCHECKED 2

#define CBN_SELCHANGE 1
#define CBN_DBLCLK    2

#define CBS_DROPDOWNLIST 1

#define CF_SCREENFONTS 1

#define CS_HREDRAW 1
#define CS_VREDRAW 2
#define CS_OWNDC   3
#define CS_DBLCLKS 4

#define CW_USEDEFAULT 1

#define DIB_RGB_COLORS 1

#define ES_LEFT      1
#define ES_MULTILINE 2
#define ES_NUMBER    3
#define ES_PASSWORD  4
#define ES_READONLY  5

#define FW_BOLD   400
#define FW_NORMAL 700

#define HWND_TOP 1

#define IDI_APPLICATION 1

#define IDC_ARROW 1

#define LBN_SELCHANGE 1
#define LBN_DBLCLK    2

#define LBS_STANDARD 1

#define LR_LOADFROMFILE 1

#define LVCF_TEXT 1

#define LVIF_TEXT 1

#define LVS_REPORT 1

#define MIIM_STATE 1
#define MIIM_ID    2
#define MIIM_TYPE  3

#define MF_POPUP      1
#define MF_STRING     2
#define MF_CHECKED    3
#define MF_SEPARATOR  4
#define MF_UNCHECKED  5
#define MF_GRAYED     6
#define MF_ENABLED    7
#define MF_BYPOSITION 8
#define MF_BYCOMMAND  9

#define MFS_CHECKED   1

#define MFT_STRING    1
#define MFT_SEPARATOR 2

#define OFN_FILEMUSTEXIST   1
#define OFN_OVERWRITEPROMPT 2

#define PC_NOCOLLAPSE 1

#define PFD_DRAW_TO_WINDOW 1
#define PFD_SUPPORT_OPENGL 2
#define PFD_DOUBLEBUFFER   3
#define PFD_TYPE_RGBA      4
#define PFD_MAIN_PLANE     5

#define PM_REMOVE 1

#define PS_SOLID 1
#define PS_DASH  2

#define RC_PALETTE 1

#define R2_NOTXORPEN 1
#define R2_COPYPEN   2

#define SS_LEFT       1
#define SS_GRAYFRAME  2
#define SS_WHITEFRAME 3

#define SM_CXSIZE      1
#define SM_CYSIZE      2
#define SM_CXSIZEFRAME 3
#define SM_CYSIZEFRAME 4

#define SW_SHOW 1
#define SW_HIDE 2

#define SWP_NOSIZE 1
#define SWP_NOMOVE 2

#define TB_ENDTRACK 1
#define TB_SETSTATE 2
#define TB_GETSTATE 3

#define TBM_SETRANGEMIN 1
#define TBM_SETRANGEMAX 2
#define TBM_SETPOS      3

#define TBM_GETRANGEMIN 1
#define TBM_GETRANGEMAX 2
#define TBM_GETPOS      3

#define TBS_HORZ 1
#define TBS_VERT 2

#define TBSTATE_ENABLED 1
#define TBSTATE_PRESSED 2
#define TBSTATE_HIDDEN  3

#define TBSTYLE_BUTTON   1
#define TBSTYLE_TOOLTIPS 2
#define TBSTYLE_SEP      3

#define TCIF_TEXT 1

#define TCN_SELCHANGE 1

#define TRACKBAR_CLASS "TrackBar"

#define TTN_NEEDTEXT 1

#define WC_TABCONTROL "TabControl"
#define WC_LISTVIEW   "ListView"

#define WM_CREATE          1
#define WM_PAINT           2
#define WM_DESTROY         3
#define WM_COMMAND         4
#define WM_SIZE            5
#define WM_LBUTTONDOWN     6
#define WM_MBUTTONDOWN     7
#define WM_RBUTTONDOWN     8
#define WM_LBUTTONUP       9
#define WM_MBUTTONUP       10
#define WM_RBUTTONUP       11
#define WM_MOUSEMOVE       12
#define WM_NOTIFY          13
#define WM_HSCROLL         14
#define WM_VSCROLL         15
#define WM_PALETTECHANGED  16
#define WM_QUERYNEWPALETTE 17
#define WS_VISIBLE         18
#define WS_CLIPCHILDREN    19
#define WS_CLIPSIBLINGS    20
#define WM_QUIT            21
#define WM_CLOSE           22

#define WS_POPUP            1
#define WS_DLGFRAME         2
#define WS_CAPTION          3
#define WS_SYSMENU          4
#define WS_CHILD            5
#define WS_OVERLAPPEDWINDOW 6
#define WS_TABSTOP          7
#define WS_BORDER           8
#define WS_GROUP            9
#define WS_EX_CLIENTEDGE    10

#define COLOR_WINDOW 1
#define COLOR_3DFACE 2

#define ANSI_FIXED_FONT 1
#define ANSI_VAR_FONT   2

#define WHITE_BRUSH  1
#define LTGRAY_BRUSH 2

#define IMAGE_BITMAP 1

#define DEFAULT_CHARSET 1

#define ERROR_SUCCESS 0

#define HKEY_LOCAL_MACHINE 1

#define RGB(r,g,b) (((r)<<16) | ((g)<<8) | (b))

#define LOWORD(w) ((w)&0xFF)
#define HIWORD(w) ((w>>8)&0xFF)

/*------*/

#define MoveTo(h,x,y) MoveToEx(h,x,y,NULL)

#define Trackbar_SetRangeMin(w,r,v) \
  SendMessage(w,TBM_SETRANGEMIN,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_SetRangeMax(w,r,v) \
  SendMessage(w,TBM_SETRANGEMAX,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_SetPos(w,r,v) \
  SendMessage(w,TBM_SETPOS,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_GetRangeMin(w) \
  SendMessage(w,TBM_GETRANGEMIN,0,0)
#define Trackbar_GetRangeMax(w) \
  SendMessage(w,TBM_GETRANGEMAX,0,0)
#define Trackbar_GetPos(w) \
  SendMessage(w,TBM_GETPOS,0,0)

#define Toolbar_SetState(w,b,s) \
  SendMessage(w,TB_SETSTATE,(WPARAM)(b),(LPARAM)MAKELONG(s,0))
#define Toolbar_GetState(w,b) \
  SendMessage(w,TB_GETSTATE,(WPARAM)(b),0)

/*------*/

typedef unsigned char   BYTE;
typedef unsigned int    COLORREF;
typedef unsigned int    DWORD;
typedef void           *FARPROC;
typedef unsigned int    HBITMAP;
typedef unsigned int    HBRUSH;
typedef unsigned int    HCURSOR;
typedef unsigned int    HDC;
typedef unsigned int    HFONT;
typedef unsigned int    HGLRC;
typedef unsigned int    HICON;
typedef unsigned int    HINSTANCE;
typedef unsigned int    HPALETTE;
typedef unsigned int    HKEY;
typedef unsigned int    HMENU;
typedef unsigned int    HMODULE;
typedef unsigned int    HPEN;
typedef unsigned int    HWND;
typedef long            LONG;
typedef unsigned long   LPARAM;
typedef char           *LPSTR;
typedef unsigned int    UINT;
typedef unsigned int   *UINT_PTR;
typedef int             WORD;
typedef unsigned int    WPARAM;

typedef struct _RECT                  RECT;
typedef struct _SIZE                  SIZE;
typedef struct _MSG                   MSG;
typedef struct _MENUITEMINFO          MENUITEMINFO;
typedef struct _WNDCLASSEX            WNDCLASSEX;
typedef struct _WINDOWINFO            WINDOWINFO;
typedef struct _PAINTSTRUCT           PAINTSTRUCT;
typedef struct _LOGFONT               LOGFONT;
typedef struct _TEXTMETRIC            TEXTMETRIC;
typedef struct _ENUMLOGFONTEX         ENUMLOGFONTEX;
typedef struct _NEWTEXTMETRICEX       NEWTEXTMETRICEX;
typedef struct _TBBUTTON              TBBUTTON;
typedef struct _TCITEM                TCITEM;
typedef struct _BITMAP                BITMAP;
typedef struct _BITMAPINFO            BITMAPINFO;
typedef struct _BITMAPINFOHEADER      BITMAPINFOHEADER;
typedef struct _NMHDR                 NMHDR;
typedef struct _TOOLTIPTEXT           TOOLTIPTEXT;
typedef struct _POINT                 POINT;
typedef struct _CHOOSECOLOR           CHOOSECOLOR;
typedef struct _OPENFILENAME          OPENFILENAME;
typedef struct _CHOOSEFONT            CHOOSEFONT;
typedef struct _LV_ITEM               LV_ITEM;
typedef struct _LV_COLUMN             LV_COLUMN;
typedef struct _LOGPALETTE            LOGPALETTE;
typedef struct _PALETTEENTRY          PALETTEENTRY;
typedef struct _BROWSEINFO            BROWSEINFO;
typedef struct _ITEMIDLIST            ITEMIDLIST;
typedef struct _PIXELFORMATDESCRIPTOR PIXELFORMATDESCRIPTOR;

typedef LRESULT CALLBACK (*_WndProc)
                            (HWND hwnd, UINT message,
                             WPARAM param1, LPARAM param2);

struct _RECT {
  long left;
  long top;
  long right;
  long bottom;
};

struct _SIZE {
  long cx;
  long cy;
};

struct _MSG {
  HWND hwnd;
  UINT message;
  WPARAM wParam;
  LPARAM lParam;
  DWORD time;
  POINT pt;
};

struct _MENUITEMINFO {
  unsigned int   cbSize;
  unsigned int   fMask;
  unsigned int   fState;
  unsigned int   fType;
  unsigned int   wID;
  char          *dwTypeData;
};

struct _WNDCLASSEX {
  unsigned int   cbSize;
  unsigned int   style;
  _WndProc       lpfnWndProc;
  int            cbClsExtra;
  int            cbWndExtra;
  HINSTANCE      hInstance;
  HICON          hIcon;
  HCURSOR        hCursor;
  HBRUSH         hbrBackground;
  char          *lpszMenuName;
  char          *lpszClassName;
  HICON          hIconSm;
};

struct _WINDOWINFO {
  unsigned int   cbSize;
  RECT           rcWindow;
};

struct _PAINTSTRUCT {
  char  *dummy;
};

struct _LOGFONT {
  int   lfCharSet;
  int   lfPitchAndFamily;
  char  lfFaceName[256];
  int   lfEscapement;
  int   lfOrientation;
  int   lfWeight;
  int   lfItalic;
  int   lfUnderline;
  int   lfStrikeOut;
};

struct _ENUMLOGFONTEX {
  LOGFONT  elfLogFont;
};

struct _NEWTEXTMETRICEX {
  char  *dummy;
};

struct _TBBUTTON {
  int  iBitmap;
  int  idCommand;
  int  fsState;
  int  fsStyle;
  int  dwData;
  int  iString;
};

struct _TCITEM {
  int    mask;
  char  *pszText;
  int    iImage;
};

struct _BITMAP {
  int  bmWidth;
  int  bmHeight;
};

struct _BITMAPINFOHEADER {
  int  biSize;
  int  biWidth;
  int  biHeight;
};

struct _BITMAPINFO {
  BITMAPINFOHEADER  bmiHeader;
};

struct _NMHDR {
  int  code;
  int  idFrom;
};

struct _TOOLTIPTEXT {
  NMHDR       hdr;
  char       *lpszText;
  HINSTANCE   hinst;
};

struct _POINT {
  int  x;
  int  y;
};

struct _TEXTMETRIC {
  int  tmHeight;
  int  tmAscent;
  int  tmDescent;
  int  tmMaxCharWidth;
};

struct _CHOOSECOLOR {
  int        lStructSize;
  int        hwndOwner;
  int        hInstance;
  int        rgbResult;
  COLORREF  *lpCustColors;
  int        Flags;
  char      *lCustData;
  char      *lpfnHook;
  char      *lpTemplateName;
};

struct _OPENFILENAME {
  int    lStructSize;
  int    hwndOwner;
  int    hInstance;
  char  *lpstrFilter;
  char  *lpstrCustomFilter;
  int    nMaxCustFilter;
  int    nFilterIndex;
  char  *lpstrFile;
  int    nMaxFile;
  char  *lpstrFileTitle;
  int    nMaxFileTitle;
  char  *lpstrInitialDir;
  char  *lpstrTitle;
  int    Flags;
  int    nFileOffset;
  int    nFileExtension;
  char  *lpstrDefExt;
  char  *lCustData;
  char  *lpfnHook;
  char  *lpTemplateName;
};

struct _CHOOSEFONT {
  int        lStructSize;
  int        hwndOwner;
  int        hDC;
  char      *lpLogFont;
  int        iPointSize;
  int        Flags;
  int        rgbColors;
  char      *lCustData;
  char      *lpfnHook;
  char      *lpTemplateName;
  int        hInstance;
  char      *lpszStyle;
  int        nFontType;
  int        nSizeMin;
  int        nSizeMax;
};

struct _LV_ITEM {
  int    mask;
  int    iItem;
  int    iSubItem;
  char  *pszText;
};

struct _LV_COLUMN {
  int    mask;
  int    iSubItem;
  char  *pszText;
};

struct _PALETTEENTRY {
  int  peRed;
  int  peGreen;
  int  peBlue;
  int  peFlags;
};

struct _LOGPALETTE {
  int           palVersion;
  int           palNumEntries;
  PALETTEENTRY  palPalEntry[1];
};

struct _BROWSEINFO {
  HWND      hwndOwner;
  char     *pidlRoot;
  char     *pszDisplayName;
  char     *lpszTitle;
  int       ulFlags;
  _WndProc  lpfn;
  LPARAM    lParam;
  int       iImage;
};

struct _ITEMIDLIST {
  char  *dummy;
};

struct _PIXELFORMATDESCRIPTOR {
  WORD  nSize;
  WORD  nVersion;
  DWORD dwFlags;
  BYTE  iPixelType;
  BYTE  cColorBits;
  BYTE  cRedBits;
  BYTE  cRedShift;
  BYTE  cGreenBits;
  BYTE  cGreenShift;
  BYTE  cBlueBits;
  BYTE  cBlueShift;
  BYTE  cAlphaBits;
  BYTE  cAlphaShift;
  BYTE  cAccumBits;
  BYTE  cAccumRedBits;
  BYTE  cAccumGreenBits;
  BYTE  cAccumBlueBits;
  BYTE  cAccumAlphaBits;
  BYTE  cDepthBits;
  BYTE  cStencilBits;
  BYTE  cAuxBuffers;
  BYTE  iLayerType;
  BYTE  bReserved;
  DWORD dwLayerMask;
  DWORD dwVisibleMask;
  DWORD dwDamageMask;
};

/*------*/

extern FARPROC GetProcAddress
                (HMODULE hmodule, char *name);

#else

#include "windows.h"
#include "windowsx.h"
#include "commctrl.h"
#include "shlobj.h"

#define MoveTo(h,x,y) MoveToEx(h,x,y,NULL)

#define Button_SetImage(w,t,h) \
  SendMessage(w,BM_SETIMAGE,(WPARAM)(t),(LPARAM)(h))

#define Static_SetImage(w,t,h) \
  SendMessage(w,STM_SETIMAGE,(WPARAM)(t),(LPARAM)(h))

#define Trackbar_SetRangeMin(w,r,v) \
  SendMessage(w,TBM_SETRANGEMIN,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_SetRangeMax(w,r,v) \
	  SendMessage(w,TBM_SETRANGEMAX,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_SetPos(w,r,v) \
	  SendMessage(w,TBM_SETPOS,(WPARAM)(r),(LPARAM)(v))
#define Trackbar_GetRangeMin(w) \
	  SendMessage(w,TBM_GETRANGEMIN,0,0)
#define Trackbar_GetRangeMax(w) \
	  SendMessage(w,TBM_GETRANGEMAX,0,0)
#define Trackbar_GetPos(w) \
	  SendMessage(w,TBM_GETPOS,0,0)

#define Toolbar_SetState(w,b,s) \
	  SendMessage(w,TB_SETSTATE,(WPARAM)(b),(LPARAM)MAKELONG(s,0))
#define Toolbar_GetState(w,b) \
	  SendMessage(w,TB_GETSTATE,(WPARAM)(b),0)

#endif

#endif
