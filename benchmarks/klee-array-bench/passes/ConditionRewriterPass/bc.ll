; ModuleID = 'bc.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.yy_buffer_state = type { %struct._IO_FILE*, i8*, i8*, i64, i32, i32, i32, i32, i32, i32, i32, i32 }
%union.yyalloc = type { i32 }

@yynerrs = common global i32 0, align 4
@yychar = common global i32 0, align 4
@yypact = internal constant [148 x i16] [i16 2, i16 -11, i16 5, i16 17, i16 -76, i16 14, i16 -76, i16 -11, i16 -76, i16 17, i16 33, i16 18, i16 -76, i16 39, i16 -11, i16 57, i16 54, i16 46, i16 35, i16 -76, i16 48, i16 57, i16 -76, i16 52, i16 68, i16 -11, i16 -76, i16 74, i16 57, i16 -11, i16 77, i16 -76, i16 82, i16 -76, i16 -76, i16 71, i16 98, i16 57, i16 84, i16 101, i16 -76, i16 -76, i16 -76, i16 121, i16 102, i16 -76, i16 35, i16 118, i16 -76, i16 123, i16 -11, i16 122, i16 134, i16 130, i16 -11, i16 4, i16 35, i16 126, i16 138, i16 140, i16 147, i16 16, i16 4, i16 152, i16 16, i16 -15, i16 -76, i16 158, i16 76, i16 76, i16 76, i16 154, i16 -15, i16 175, i16 76, i16 -76, i16 76, i16 76, i16 16, i16 -76, i16 -76, i16 -76, i16 58, i16 -76, i16 76, i16 76, i16 149, i16 -76, i16 159, i16 169, i16 -76, i16 76, i16 100, i16 113, i16 189, i16 164, i16 177, i16 180, i16 178, i16 179, i16 76, i16 76, i16 76, i16 76, i16 76, i16 15, i16 76, i16 16, i16 16, i16 183, i16 125, i16 188, i16 -76, i16 206, i16 198, i16 76, i16 205, i16 -76, i16 72, i16 199, i16 92, i16 92, i16 63, i16 -76, i16 211, i16 210, i16 242, i16 -76, i16 -76, i16 212, i16 -76, i16 76, i16 -76, i16 209, i16 -76, i16 -76, i16 76, i16 16, i16 -76, i16 137, i16 -76, i16 214, i16 87, i16 -76, i16 -76, i16 -76, i16 76, i16 -76], align 16
@yytranslate = internal constant [280 x i8] c"\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02 \02\02\02\02\02\02\22$\1E\1C'\1D\1F\02\02\02\02\02\02\02\02\02\02\02\02&!\19\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\1B\02#\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\1A\02%\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18", align 16
@yycheck = internal constant [252 x i8] c"\01\12\15N\1C\00\07\03\06\05\19\16\1B\0E\0F\0B\0C\12%\03\15\05\12\06\19\07\16\1C\1D.\1A7kl\12\14%\16\168\1A\08\1A>\1A.\0B\0C\092DEF678J\16LM=>\89@\0A\08TU\0B\0C\0C\15\1A[\18\1B\08N\1C\16\16Rdefgh%j%\0E\0F\10\11\1F\15!s\16\17\1C\1D\1E\1Fi!kl &\22\18#\83\1B\1C\1D\1E\1F%!%\1E\1F\18!'\1B\1C\1D\1E\1F\22!\0D\22\89\18&%\1B\1C\1D\1E\1F\1B!=>\18@&\1B\1C\1D\1E\1F#!$\1A\18$&\1B\1C\1D\1E\1F'!\13\22\18\22&\1B\1C\1D\1E\1F\22!\18\1A$\1B\1C\1D\1E\1F%!\18\13$\1B\1C\1D\1E\1F%!\18\1B$\1B\1C\1D\1E\1F!!\18\22$\1B\1C\1D\1E\1F&!\18#%\1B\1C\1D\1E\1F\19!\18#%\1B\1C\1D\1E\1F$!!#\22\04\098%$\92", align 16
@yytable = internal constant [252 x i16] [i16 5, i16 29, i16 31, i16 95, i16 37, i16 6, i16 11, i16 58, i16 1, i16 59, i16 76, i16 4, i16 77, i16 17, i16 26, i16 19, i16 20, i16 26, i16 31, i16 58, i16 26, i16 59, i16 60, i16 7, i16 35, i16 14, i16 4, i16 26, i16 39, i16 50, i16 61, i16 62, i16 126, i16 127, i16 60, i16 123, i16 26, i16 4, i16 4, i16 50, i16 10, i16 13, i16 61, i16 31, i16 15, i16 26, i16 19, i16 20, i16 16, i16 53, i16 86, i16 88, i16 89, i16 57, i16 65, i16 26, i16 92, i16 4, i16 93, i16 94, i16 72, i16 65, i16 143, i16 72, i16 27, i16 18, i16 98, i16 99, i16 19, i16 20, i16 96, i16 32, i16 28, i16 110, i16 34, i16 30, i16 18, i16 72, i16 38, i16 4, i16 4, i16 97, i16 118, i16 119, i16 120, i16 121, i16 122, i16 44, i16 125, i16 33, i16 79, i16 80, i16 81, i16 82, i16 105, i16 36, i16 106, i16 133, i16 4, i16 83, i16 102, i16 103, i16 104, i16 105, i16 124, i16 106, i16 72, i16 72, i16 84, i16 42, i16 85, i16 100, i16 40, i16 139, i16 101, i16 102, i16 103, i16 104, i16 105, i16 41, i16 106, i16 45, i16 104, i16 105, i16 100, i16 106, i16 146, i16 101, i16 102, i16 103, i16 104, i16 105, i16 43, i16 106, i16 47, i16 46, i16 72, i16 100, i16 111, i16 48, i16 101, i16 102, i16 103, i16 104, i16 105, i16 51, i16 106, i16 71, i16 73, i16 100, i16 75, i16 112, i16 101, i16 102, i16 103, i16 104, i16 105, i16 54, i16 106, i16 52, i16 55, i16 100, i16 67, i16 129, i16 101, i16 102, i16 103, i16 104, i16 105, i16 56, i16 106, i16 74, i16 68, i16 100, i16 69, i16 144, i16 101, i16 102, i16 103, i16 104, i16 105, i16 70, i16 106, i16 100, i16 78, i16 107, i16 101, i16 102, i16 103, i16 104, i16 105, i16 90, i16 106, i16 100, i16 91, i16 108, i16 101, i16 102, i16 103, i16 104, i16 105, i16 114, i16 106, i16 100, i16 115, i16 109, i16 101, i16 102, i16 103, i16 104, i16 105, i16 106, i16 106, i16 100, i16 116, i16 117, i16 101, i16 102, i16 103, i16 104, i16 105, i16 128, i16 106, i16 100, i16 113, i16 130, i16 101, i16 102, i16 103, i16 104, i16 105, i16 131, i16 106, i16 100, i16 135, i16 132, i16 101, i16 102, i16 103, i16 104, i16 105, i16 134, i16 106, i16 -1, i16 140, i16 136, i16 137, i16 12, i16 66, i16 138, i16 145, i16 147], align 16
@yylval = common global i32 0, align 4
@yydefact = internal constant [148 x i8] c"\00\00\00\054\00\01\00\02\05\00\00\04\00\00\0E\00\00\00\15\16\0E\0A\00\0E\00\17\00\0E\00\00\0B\00\07\0D\00\00\0E\00\00\14\06\0C\00\00\09\13\00\08\00\00\00\00\11\00\19\13\00\00\00\00\19\19\00\19\17\12\00\00\00\00\00\00\00\00\18\00\00\00,-/\00+\00\00\00.\00\00\1A\00\00\00\00\00\00\002\00\00\00\00\00\00\00\00\00\00\00\00\00\1E\00\00\00\003#\00%&')\00$\00\1C\1D\00\10\00\03\001(\22\00\0F\000\00 \1B\1F*\22!", align 16
@yyr2 = internal constant [53 x i8] c"\00\02\02\11\02\00\06\05\08\07\01\02\03\02\00\0D\0C\02\04\00\03\01\01\01\02\00\03\07\05\05\04\07\01\03\00\03\03\03\03\03\04\03\06\01\01\01\01\01\05\04\02\03\01", align 16
@.str = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1
@yyr1 = internal constant [53 x i8] c"\00()*++,,,,--.//00111222233444444555666666666666666667", align 16
@yypgoto = internal constant [16 x i16] [i16 -76, i16 -76, i16 -76, i16 238, i16 -76, i16 -24, i16 -19, i16 50, i16 -76, i16 192, i16 -17, i16 86, i16 -75, i16 105, i16 -18, i16 -1], align 16
@yydefgoto = internal constant [16 x i16] [i16 -1, i16 2, i16 3, i16 8, i16 9, i16 21, i16 22, i16 23, i16 24, i16 49, i16 25, i16 63, i16 64, i16 141, i16 142, i16 87], align 16
@.str1 = private unnamed_addr constant [13 x i8] c"syntax error\00", align 1
@.str2 = private unnamed_addr constant [18 x i8] c"Error: discarding\00", align 1
@.str3 = private unnamed_addr constant [15 x i8] c"Error: popping\00", align 1
@yystos = internal constant [148 x i8] c"\00\06)*\167\00\06+,\1A7+\08\07\1A\097\08\0B\0C-./027\0A\1A2\1B./%/7\15-/7#%&\22/%\22\0D%12\1B$7#\1A'7\03\05\12\1A-3471$\22\22\22373\133\19\1B\1A\0E\0F\10\11\17 \226766%\136664\0C766\18\1B\1C\1D\1E\1F!$$$6&&#%\1B\22$66666\147644&&%\19%6$#\22\04%6#564&$'5", align 16
@.str4 = private unnamed_addr constant [17 x i8] c"memory exhausted\00", align 1
@.str5 = private unnamed_addr constant [30 x i8] c"Cleanup: discarding lookahead\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"Cleanup: popping\00", align 1
@stderr = external global %struct._IO_FILE*
@.str7 = private unnamed_addr constant [13 x i8] c"line %d: %s\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"Deleting\00", align 1
@yyin = global %struct._IO_FILE* null, align 8
@yyout = global %struct._IO_FILE* null, align 8
@yylineno = global i32 1, align 4
@yy_flex_debug = global i32 0, align 4
@yy_init = internal global i32 0, align 4
@yy_start = internal global i32 0, align 4
@stdin = external global %struct._IO_FILE*
@stdout = external global %struct._IO_FILE*
@yy_buffer_stack = internal global %struct.yy_buffer_state** null, align 8
@yy_buffer_stack_top = internal global i64 0, align 8
@yy_c_buf_p = internal global i8* null, align 8
@yy_hold_char = internal global i8 0, align 1
@yy_ec = internal constant [256 x i32] [i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2, i32 3, i32 1, i32 1, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2, i32 4, i32 1, i32 1, i32 1, i32 1, i32 5, i32 1, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 14, i32 1, i32 15, i32 16, i32 17, i32 1, i32 1, i32 1, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 19, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 18, i32 20, i32 21, i32 22, i32 1, i32 23, i32 1, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 18, i32 18, i32 33, i32 34, i32 35, i32 36, i32 37, i32 18, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 18, i32 46, i32 1, i32 47, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16
@yy_accept = internal constant [138 x i16] [i16 0, i16 0, i16 0, i16 44, i16 42, i16 40, i16 41, i16 27, i16 42, i16 30, i16 31, i16 26, i16 24, i16 36, i16 25, i16 29, i16 42, i16 21, i16 37, i16 23, i16 28, i16 20, i16 20, i16 32, i16 33, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 34, i16 35, i16 22, i16 0, i16 0, i16 21, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 1, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 0, i16 0, i16 0, i16 38, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 10, i16 20, i16 20, i16 15, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 20, i16 39, i16 20, i16 20, i16 20, i16 20, i16 2, i16 20, i16 20, i16 20, i16 19, i16 20, i16 20, i16 20, i16 14, i16 12, i16 8, i16 20, i16 20, i16 20, i16 20, i16 4, i16 20, i16 13, i16 20, i16 20, i16 20, i16 20, i16 3, i16 11, i16 20, i16 20, i16 20, i16 18, i16 6, i16 17, i16 7, i16 0, i16 9, i16 5, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 16, i16 0], align 16
@yy_last_accepting_state = internal global i32 0, align 4
@yy_last_accepting_cpos = internal global i8* null, align 8
@yy_base = internal constant [141 x i16] [i16 0, i16 0, i16 0, i16 151, i16 152, i16 152, i16 152, i16 152, i16 145, i16 152, i16 152, i16 152, i16 152, i16 152, i16 152, i16 152, i16 40, i16 135, i16 152, i16 152, i16 152, i16 0, i16 9, i16 152, i16 152, i16 112, i16 114, i16 17, i16 122, i16 22, i16 117, i16 120, i16 115, i16 101, i16 113, i16 100, i16 21, i16 103, i16 107, i16 152, i16 152, i16 152, i16 129, i16 133, i16 121, i16 0, i16 96, i16 94, i16 96, i16 107, i16 91, i16 89, i16 95, i16 0, i16 87, i16 91, i16 93, i16 81, i16 98, i16 82, i16 97, i16 88, i16 78, i16 86, i16 85, i16 108, i16 47, i16 112, i16 152, i16 82, i16 73, i16 79, i16 72, i16 82, i16 81, i16 69, i16 0, i16 77, i16 71, i16 0, i16 72, i16 63, i16 63, i16 63, i16 73, i16 73, i16 66, i16 90, i16 62, i16 68, i16 67, i16 55, i16 0, i16 58, i16 64, i16 51, i16 0, i16 58, i16 51, i16 56, i16 0, i16 0, i16 0, i16 59, i16 56, i16 51, i16 60, i16 0, i16 56, i16 0, i16 51, i16 55, i16 45, i16 53, i16 0, i16 0, i16 66, i16 42, i16 37, i16 0, i16 0, i16 0, i16 0, i16 39, i16 0, i16 0, i16 33, i16 33, i16 55, i16 29, i16 27, i16 32, i16 28, i16 22, i16 27, i16 23, i16 152, i16 152, i16 54, i16 68, i16 70], align 16
@yy_chk = internal constant [200 x i16] [i16 0, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 1, i16 16, i16 22, i16 27, i16 29, i16 36, i16 16, i16 22, i16 66, i16 138, i16 29, i16 135, i16 36, i16 134, i16 27, i16 133, i16 132, i16 131, i16 130, i16 129, i16 128, i16 66, i16 139, i16 139, i16 140, i16 140, i16 127, i16 126, i16 123, i16 118, i16 117, i16 116, i16 113, i16 112, i16 111, i16 110, i16 108, i16 106, i16 105, i16 104, i16 103, i16 99, i16 98, i16 97, i16 95, i16 94, i16 93, i16 91, i16 90, i16 89, i16 88, i16 87, i16 86, i16 85, i16 84, i16 83, i16 82, i16 81, i16 80, i16 78, i16 77, i16 75, i16 74, i16 73, i16 72, i16 71, i16 70, i16 69, i16 67, i16 65, i16 64, i16 63, i16 62, i16 61, i16 60, i16 59, i16 58, i16 57, i16 56, i16 55, i16 54, i16 52, i16 51, i16 50, i16 49, i16 48, i16 47, i16 46, i16 44, i16 43, i16 42, i16 38, i16 37, i16 35, i16 34, i16 33, i16 32, i16 31, i16 30, i16 28, i16 26, i16 25, i16 17, i16 8, i16 3, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137], align 16
@yy_def = internal constant [141 x i16] [i16 0, i16 137, i16 1, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 138, i16 138, i16 137, i16 137, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 137, i16 137, i16 137, i16 139, i16 140, i16 137, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 139, i16 139, i16 140, i16 137, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 139, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 138, i16 137, i16 138, i16 138, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 0, i16 137, i16 137, i16 137], align 16
@yy_meta = internal constant [48 x i32] [i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 2, i32 1, i32 1, i32 1, i32 2, i32 2, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@yy_nxt = internal constant [200 x i16] [i16 0, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 16, i16 17, i16 18, i16 19, i16 20, i16 21, i16 22, i16 23, i16 4, i16 24, i16 4, i16 21, i16 25, i16 26, i16 21, i16 27, i16 28, i16 21, i16 21, i16 29, i16 30, i16 31, i16 32, i16 21, i16 33, i16 34, i16 35, i16 36, i16 21, i16 37, i16 38, i16 21, i16 21, i16 39, i16 40, i16 42, i16 46, i16 50, i16 53, i16 61, i16 43, i16 47, i16 66, i16 45, i16 54, i16 136, i16 62, i16 135, i16 51, i16 134, i16 133, i16 132, i16 131, i16 130, i16 129, i16 87, i16 65, i16 65, i16 67, i16 67, i16 128, i16 127, i16 126, i16 125, i16 124, i16 123, i16 122, i16 121, i16 120, i16 119, i16 118, i16 117, i16 116, i16 115, i16 114, i16 113, i16 112, i16 111, i16 110, i16 109, i16 108, i16 107, i16 106, i16 105, i16 104, i16 66, i16 103, i16 102, i16 101, i16 100, i16 99, i16 98, i16 97, i16 96, i16 95, i16 94, i16 93, i16 92, i16 91, i16 90, i16 89, i16 88, i16 68, i16 66, i16 86, i16 85, i16 84, i16 83, i16 82, i16 81, i16 80, i16 79, i16 78, i16 77, i16 76, i16 75, i16 74, i16 73, i16 72, i16 71, i16 70, i16 69, i16 44, i16 68, i16 66, i16 64, i16 63, i16 60, i16 59, i16 58, i16 57, i16 56, i16 55, i16 52, i16 49, i16 48, i16 44, i16 41, i16 137, i16 3, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137, i16 137], align 16
@yytext = common global i8* null, align 8
@yyleng = common global i32 0, align 4
@.str9 = private unnamed_addr constant [18 x i8] c"Unknown character\00", align 1
@yy_n_chars = internal global i32 0, align 4
@yy_did_buffer_switch_on_eof = internal global i32 0, align 4
@.str110 = private unnamed_addr constant [51 x i8] c"fatal flex scanner internal error--no action found\00", align 1
@.str211 = private unnamed_addr constant [44 x i8] c"out of dynamic memory in yy_create_buffer()\00", align 1
@.str312 = private unnamed_addr constant [42 x i8] c"out of dynamic memory in yy_scan_buffer()\00", align 1
@.str413 = private unnamed_addr constant [41 x i8] c"out of dynamic memory in yy_scan_bytes()\00", align 1
@.str514 = private unnamed_addr constant [30 x i8] c"bad buffer in yy_scan_bytes()\00", align 1
@column = global i32 0, align 4
@yy_buffer_stack_max = internal global i64 0, align 8
@.str615 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str716 = private unnamed_addr constant [49 x i8] c"out of dynamic memory in yyensure_buffer_stack()\00", align 1
@.str817 = private unnamed_addr constant [56 x i8] c"fatal flex scanner internal error--end of buffer missed\00", align 1
@.str918 = private unnamed_addr constant [44 x i8] c"fatal error - scanner input buffer overflow\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"input in flex scanner failed\00", align 1
@.str11 = private unnamed_addr constant [46 x i8] c"out of dynamic memory in yy_get_next_buffer()\00", align 1

; Function Attrs: nounwind uwtable
define i32 @yyparse() #0 {
  %yystate = alloca i32, align 4
  %yyerrstatus = alloca i32, align 4
  %yyssa = alloca [200 x i16], align 16
  %yyss = alloca i16*, align 8
  %yyssp = alloca i16*, align 8
  %yyvsa = alloca [200 x i32], align 16
  %yyvs = alloca i32*, align 8
  %yyvsp = alloca i32*, align 8
  %yystacksize = alloca i64, align 8
  %yyn = alloca i32, align 4
  %yyresult = alloca i32, align 4
  %yytoken = alloca i32, align 4
  %yyval = alloca i32, align 4
  %yylen = alloca i32, align 4
  %yysize = alloca i64, align 8
  %yyss1 = alloca i16*, align 8
  %yyptr = alloca %union.yyalloc*, align 8
  %yynewbytes = alloca i64, align 8
  %yynewbytes1 = alloca i64, align 8
  store i32 0, i32* %yytoken, align 4
  store i32 0, i32* %yylen, align 4
  %1 = getelementptr inbounds [200 x i16]* %yyssa, i32 0, i32 0
  store i16* %1, i16** %yyss, align 8
  store i16* %1, i16** %yyssp, align 8
  %2 = getelementptr inbounds [200 x i32]* %yyvsa, i32 0, i32 0
  store i32* %2, i32** %yyvs, align 8
  store i32* %2, i32** %yyvsp, align 8
  store i64 200, i64* %yystacksize, align 8
  store i32 0, i32* %yystate, align 4
  store i32 0, i32* %yyerrstatus, align 4
  store i32 0, i32* @yynerrs, align 4
  store i32 -2, i32* @yychar, align 4
  br label %6

; <label>:3                                       ; preds = %372, %265, %177
  %4 = load i16** %yyssp, align 8
  %5 = getelementptr inbounds i16* %4, i32 1
  store i16* %5, i16** %yyssp, align 8
  br label %6

; <label>:6                                       ; preds = %3, %0
  %7 = load i32* %yystate, align 4
  %8 = trunc i32 %7 to i16
  %9 = load i16** %yyssp, align 8
  store i16 %8, i16* %9, align 2
  %10 = load i16** %yyss, align 8
  %11 = load i64* %yystacksize, align 8
  %12 = getelementptr inbounds i16* %10, i64 %11
  %13 = getelementptr inbounds i16* %12, i64 -1
  %14 = load i16** %yyssp, align 8
  %15 = icmp ule i16* %13, %14
  br i1 %15, label %16, label %103

; <label>:16                                      ; preds = %6
  %17 = load i16** %yyssp, align 8
  %18 = load i16** %yyss, align 8
  %19 = ptrtoint i16* %17 to i64
  %20 = ptrtoint i16* %18 to i64
  %21 = sub i64 %19, %20
  %22 = sdiv exact i64 %21, 2
  %23 = add nsw i64 %22, 1
  store i64 %23, i64* %yysize, align 8
  %24 = load i64* %yystacksize, align 8
  %25 = icmp ule i64 10000, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %16
  br label %379

; <label>:27                                      ; preds = %16
  %28 = load i64* %yystacksize, align 8
  %29 = mul i64 %28, 2
  store i64 %29, i64* %yystacksize, align 8
  %30 = load i64* %yystacksize, align 8
  %31 = icmp ult i64 10000, %30
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %27
  store i64 10000, i64* %yystacksize, align 8
  br label %33

; <label>:33                                      ; preds = %32, %27
  %34 = load i16** %yyss, align 8
  store i16* %34, i16** %yyss1, align 8
  %35 = load i64* %yystacksize, align 8
  %36 = mul i64 %35, 6
  %37 = add i64 %36, 3
  %38 = call noalias i8* @malloc(i64 %37) #2
  %39 = bitcast i8* %38 to %union.yyalloc*
  store %union.yyalloc* %39, %union.yyalloc** %yyptr, align 8
  %40 = load %union.yyalloc** %yyptr, align 8
  %41 = icmp ne %union.yyalloc* %40, null
  br i1 %41, label %43, label %42

; <label>:42                                      ; preds = %33
  br label %379

; <label>:43                                      ; preds = %33
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load %union.yyalloc** %yyptr, align 8
  %46 = bitcast %union.yyalloc* %45 to i16*
  %47 = bitcast i16* %46 to i8*
  %48 = load i16** %yyss, align 8
  %49 = bitcast i16* %48 to i8*
  %50 = load i64* %yysize, align 8
  %51 = mul i64 %50, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %47, i8* %49, i64 %51, i32 2, i1 false)
  %52 = load %union.yyalloc** %yyptr, align 8
  %53 = bitcast %union.yyalloc* %52 to i16*
  store i16* %53, i16** %yyss, align 8
  %54 = load i64* %yystacksize, align 8
  %55 = mul i64 %54, 2
  %56 = add i64 %55, 3
  store i64 %56, i64* %yynewbytes, align 8
  %57 = load i64* %yynewbytes, align 8
  %58 = udiv i64 %57, 4
  %59 = load %union.yyalloc** %yyptr, align 8
  %60 = getelementptr inbounds %union.yyalloc* %59, i64 %58
  store %union.yyalloc* %60, %union.yyalloc** %yyptr, align 8
  br label %61

; <label>:61                                      ; preds = %44
  br label %62

; <label>:62                                      ; preds = %61
  %63 = load %union.yyalloc** %yyptr, align 8
  %64 = bitcast %union.yyalloc* %63 to i32*
  %65 = bitcast i32* %64 to i8*
  %66 = load i32** %yyvs, align 8
  %67 = bitcast i32* %66 to i8*
  %68 = load i64* %yysize, align 8
  %69 = mul i64 %68, 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %67, i64 %69, i32 4, i1 false)
  %70 = load %union.yyalloc** %yyptr, align 8
  %71 = bitcast %union.yyalloc* %70 to i32*
  store i32* %71, i32** %yyvs, align 8
  %72 = load i64* %yystacksize, align 8
  %73 = mul i64 %72, 4
  %74 = add i64 %73, 3
  store i64 %74, i64* %yynewbytes1, align 8
  %75 = load i64* %yynewbytes1, align 8
  %76 = udiv i64 %75, 4
  %77 = load %union.yyalloc** %yyptr, align 8
  %78 = getelementptr inbounds %union.yyalloc* %77, i64 %76
  store %union.yyalloc* %78, %union.yyalloc** %yyptr, align 8
  br label %79

; <label>:79                                      ; preds = %62
  %80 = load i16** %yyss1, align 8
  %81 = getelementptr inbounds [200 x i16]* %yyssa, i32 0, i32 0
  %82 = icmp ne i16* %80, %81
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %79
  %84 = load i16** %yyss1, align 8
  %85 = bitcast i16* %84 to i8*
  call void @free(i8* %85) #2
  br label %86

; <label>:86                                      ; preds = %83, %79
  %87 = load i16** %yyss, align 8
  %88 = load i64* %yysize, align 8
  %89 = getelementptr inbounds i16* %87, i64 %88
  %90 = getelementptr inbounds i16* %89, i64 -1
  store i16* %90, i16** %yyssp, align 8
  %91 = load i32** %yyvs, align 8
  %92 = load i64* %yysize, align 8
  %93 = getelementptr inbounds i32* %91, i64 %92
  %94 = getelementptr inbounds i32* %93, i64 -1
  store i32* %94, i32** %yyvsp, align 8
  %95 = load i16** %yyss, align 8
  %96 = load i64* %yystacksize, align 8
  %97 = getelementptr inbounds i16* %95, i64 %96
  %98 = getelementptr inbounds i16* %97, i64 -1
  %99 = load i16** %yyssp, align 8
  %100 = icmp ule i16* %98, %99
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %86
  br label %378

; <label>:102                                     ; preds = %86
  br label %103

; <label>:103                                     ; preds = %102, %6
  %104 = load i32* %yystate, align 4
  %105 = icmp eq i32 %104, 6
  br i1 %105, label %106, label %107

; <label>:106                                     ; preds = %103
  br label %377

; <label>:107                                     ; preds = %103
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32* %yystate, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [148 x i16]* @yypact, i32 0, i64 %110
  %112 = load i16* %111, align 2
  %113 = sext i16 %112 to i32
  store i32 %113, i32* %yyn, align 4
  %114 = load i32* %yyn, align 4
  %115 = icmp eq i32 %114, -76
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %108
  br label %182

; <label>:117                                     ; preds = %108
  %118 = load i32* @yychar, align 4
  %119 = icmp eq i32 %118, -2
  br i1 %119, label %120, label %122

; <label>:120                                     ; preds = %117
  %121 = call i32 @yylex()
  store i32 %121, i32* @yychar, align 4
  br label %122

; <label>:122                                     ; preds = %120, %117
  %123 = load i32* @yychar, align 4
  %124 = icmp sle i32 %123, 0
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %122
  store i32 0, i32* %yytoken, align 4
  store i32 0, i32* @yychar, align 4
  br label %138

; <label>:126                                     ; preds = %122
  %127 = load i32* @yychar, align 4
  %128 = icmp ule i32 %127, 279
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %126
  %130 = load i32* @yychar, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [280 x i8]* @yytranslate, i32 0, i64 %131
  %133 = load i8* %132, align 1
  %134 = zext i8 %133 to i32
  br label %136

; <label>:135                                     ; preds = %126
  br label %136

; <label>:136                                     ; preds = %135, %129
  %137 = phi i32 [ %134, %129 ], [ 2, %135 ]
  store i32 %137, i32* %yytoken, align 4
  br label %138

; <label>:138                                     ; preds = %136, %125
  %139 = load i32* %yytoken, align 4
  %140 = load i32* %yyn, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* %yyn, align 4
  %142 = load i32* %yyn, align 4
  %143 = icmp slt i32 %142, 0
  br i1 %143, label %155, label %144

; <label>:144                                     ; preds = %138
  %145 = load i32* %yyn, align 4
  %146 = icmp slt i32 251, %145
  br i1 %146, label %155, label %147

; <label>:147                                     ; preds = %144
  %148 = load i32* %yyn, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [252 x i8]* @yycheck, i32 0, i64 %149
  %151 = load i8* %150, align 1
  %152 = zext i8 %151 to i32
  %153 = load i32* %yytoken, align 4
  %154 = icmp ne i32 %152, %153
  br i1 %154, label %155, label %156

; <label>:155                                     ; preds = %147, %144, %138
  br label %182

; <label>:156                                     ; preds = %147
  %157 = load i32* %yyn, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [252 x i16]* @yytable, i32 0, i64 %158
  %160 = load i16* %159, align 2
  %161 = sext i16 %160 to i32
  store i32 %161, i32* %yyn, align 4
  %162 = load i32* %yyn, align 4
  %163 = icmp sle i32 %162, 0
  br i1 %163, label %164, label %171

; <label>:164                                     ; preds = %156
  %165 = load i32* %yyn, align 4
  %166 = icmp eq i32 %165, -1
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %164
  br label %266

; <label>:168                                     ; preds = %164
  %169 = load i32* %yyn, align 4
  %170 = sub nsw i32 0, %169
  store i32 %170, i32* %yyn, align 4
  br label %192

; <label>:171                                     ; preds = %156
  %172 = load i32* %yyerrstatus, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %177

; <label>:174                                     ; preds = %171
  %175 = load i32* %yyerrstatus, align 4
  %176 = add nsw i32 %175, -1
  store i32 %176, i32* %yyerrstatus, align 4
  br label %177

; <label>:177                                     ; preds = %174, %171
  store i32 -2, i32* @yychar, align 4
  %178 = load i32* %yyn, align 4
  store i32 %178, i32* %yystate, align 4
  %179 = load i32* @yylval, align 4
  %180 = load i32** %yyvsp, align 8
  %181 = getelementptr inbounds i32* %180, i32 1
  store i32* %181, i32** %yyvsp, align 8
  store i32 %179, i32* %181, align 4
  br label %3

; <label>:182                                     ; preds = %155, %116
  %183 = load i32* %yystate, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [148 x i8]* @yydefact, i32 0, i64 %184
  %186 = load i8* %185, align 1
  %187 = zext i8 %186 to i32
  store i32 %187, i32* %yyn, align 4
  %188 = load i32* %yyn, align 4
  %189 = icmp eq i32 %188, 0
  br i1 %189, label %190, label %191

; <label>:190                                     ; preds = %182
  br label %266

; <label>:191                                     ; preds = %182
  br label %192

; <label>:192                                     ; preds = %191, %168
  %193 = load i32* %yyn, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [53 x i8]* @yyr2, i32 0, i64 %194
  %196 = load i8* %195, align 1
  %197 = zext i8 %196 to i32
  store i32 %197, i32* %yylen, align 4
  %198 = load i32* %yylen, align 4
  %199 = sub nsw i32 1, %198
  %200 = sext i32 %199 to i64
  %201 = load i32** %yyvsp, align 8
  %202 = getelementptr inbounds i32* %201, i64 %200
  %203 = load i32* %202, align 4
  store i32 %203, i32* %yyval, align 4
  %204 = load i32* %yyn, align 4
  switch i32 %204, label %207 [
    i32 2, label %205
  ]

; <label>:205                                     ; preds = %192
  %206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0))
  br label %208

; <label>:207                                     ; preds = %192
  br label %208

; <label>:208                                     ; preds = %207, %205
  %209 = load i32* %yylen, align 4
  %210 = load i32** %yyvsp, align 8
  %211 = sext i32 %209 to i64
  %212 = sub i64 0, %211
  %213 = getelementptr inbounds i32* %210, i64 %212
  store i32* %213, i32** %yyvsp, align 8
  %214 = load i32* %yylen, align 4
  %215 = load i16** %yyssp, align 8
  %216 = sext i32 %214 to i64
  %217 = sub i64 0, %216
  %218 = getelementptr inbounds i16* %215, i64 %217
  store i16* %218, i16** %yyssp, align 8
  store i32 0, i32* %yylen, align 4
  %219 = load i32* %yyval, align 4
  %220 = load i32** %yyvsp, align 8
  %221 = getelementptr inbounds i32* %220, i32 1
  store i32* %221, i32** %yyvsp, align 8
  store i32 %219, i32* %221, align 4
  %222 = load i32* %yyn, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [53 x i8]* @yyr1, i32 0, i64 %223
  %225 = load i8* %224, align 1
  %226 = zext i8 %225 to i32
  store i32 %226, i32* %yyn, align 4
  %227 = load i32* %yyn, align 4
  %228 = sub nsw i32 %227, 40
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [16 x i16]* @yypgoto, i32 0, i64 %229
  %231 = load i16* %230, align 2
  %232 = sext i16 %231 to i32
  %233 = load i16** %yyssp, align 8
  %234 = load i16* %233, align 2
  %235 = sext i16 %234 to i32
  %236 = add nsw i32 %232, %235
  store i32 %236, i32* %yystate, align 4
  %237 = load i32* %yystate, align 4
  %238 = icmp sle i32 0, %237
  br i1 %238, label %239, label %258

; <label>:239                                     ; preds = %208
  %240 = load i32* %yystate, align 4
  %241 = icmp sle i32 %240, 251
  br i1 %241, label %242, label %258

; <label>:242                                     ; preds = %239
  %243 = load i32* %yystate, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [252 x i8]* @yycheck, i32 0, i64 %244
  %246 = load i8* %245, align 1
  %247 = zext i8 %246 to i32
  %248 = load i16** %yyssp, align 8
  %249 = load i16* %248, align 2
  %250 = sext i16 %249 to i32
  %251 = icmp eq i32 %247, %250
  br i1 %251, label %252, label %258

; <label>:252                                     ; preds = %242
  %253 = load i32* %yystate, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [252 x i16]* @yytable, i32 0, i64 %254
  %256 = load i16* %255, align 2
  %257 = sext i16 %256 to i32
  store i32 %257, i32* %yystate, align 4
  br label %265

; <label>:258                                     ; preds = %242, %239, %208
  %259 = load i32* %yyn, align 4
  %260 = sub nsw i32 %259, 40
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [16 x i16]* @yydefgoto, i32 0, i64 %261
  %263 = load i16* %262, align 2
  %264 = sext i16 %263 to i32
  store i32 %264, i32* %yystate, align 4
  br label %265

; <label>:265                                     ; preds = %258, %252
  br label %3

; <label>:266                                     ; preds = %190, %167
  %267 = load i32* @yychar, align 4
  %268 = icmp eq i32 %267, -2
  br i1 %268, label %269, label %270

; <label>:269                                     ; preds = %266
  br label %282

; <label>:270                                     ; preds = %266
  %271 = load i32* @yychar, align 4
  %272 = icmp ule i32 %271, 279
  br i1 %272, label %273, label %279

; <label>:273                                     ; preds = %270
  %274 = load i32* @yychar, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [280 x i8]* @yytranslate, i32 0, i64 %275
  %277 = load i8* %276, align 1
  %278 = zext i8 %277 to i32
  br label %280

; <label>:279                                     ; preds = %270
  br label %280

; <label>:280                                     ; preds = %279, %273
  %281 = phi i32 [ %278, %273 ], [ 2, %279 ]
  br label %282

; <label>:282                                     ; preds = %280, %269
  %283 = phi i32 [ -2, %269 ], [ %281, %280 ]
  store i32 %283, i32* %yytoken, align 4
  %284 = load i32* %yyerrstatus, align 4
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %289, label %286

; <label>:286                                     ; preds = %282
  %287 = load i32* @yynerrs, align 4
  %288 = add nsw i32 %287, 1
  store i32 %288, i32* @yynerrs, align 4
  call void @yyerror(i8* getelementptr inbounds ([13 x i8]* @.str1, i32 0, i32 0))
  br label %289

; <label>:289                                     ; preds = %286, %282
  %290 = load i32* %yyerrstatus, align 4
  %291 = icmp eq i32 %290, 3
  br i1 %291, label %292, label %303

; <label>:292                                     ; preds = %289
  %293 = load i32* @yychar, align 4
  %294 = icmp sle i32 %293, 0
  br i1 %294, label %295, label %300

; <label>:295                                     ; preds = %292
  %296 = load i32* @yychar, align 4
  %297 = icmp eq i32 %296, 0
  br i1 %297, label %298, label %299

; <label>:298                                     ; preds = %295
  br label %378

; <label>:299                                     ; preds = %295
  br label %302

; <label>:300                                     ; preds = %292
  %301 = load i32* %yytoken, align 4
  call void @yydestruct(i8* getelementptr inbounds ([18 x i8]* @.str2, i32 0, i32 0), i32 %301, i32* @yylval)
  store i32 -2, i32* @yychar, align 4
  br label %302

; <label>:302                                     ; preds = %300, %299
  br label %303

; <label>:303                                     ; preds = %302, %289
  br label %318
                                                  ; No predecessors!
  %305 = load i32* %yylen, align 4
  %306 = load i32** %yyvsp, align 8
  %307 = sext i32 %305 to i64
  %308 = sub i64 0, %307
  %309 = getelementptr inbounds i32* %306, i64 %308
  store i32* %309, i32** %yyvsp, align 8
  %310 = load i32* %yylen, align 4
  %311 = load i16** %yyssp, align 8
  %312 = sext i32 %310 to i64
  %313 = sub i64 0, %312
  %314 = getelementptr inbounds i16* %311, i64 %313
  store i16* %314, i16** %yyssp, align 8
  store i32 0, i32* %yylen, align 4
  %315 = load i16** %yyssp, align 8
  %316 = load i16* %315, align 2
  %317 = sext i16 %316 to i32
  store i32 %317, i32* %yystate, align 4
  br label %318

; <label>:318                                     ; preds = %304, %303
  store i32 3, i32* %yyerrstatus, align 4
  br label %319

; <label>:319                                     ; preds = %358, %318
  %320 = load i32* %yystate, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [148 x i16]* @yypact, i32 0, i64 %321
  %323 = load i16* %322, align 2
  %324 = sext i16 %323 to i32
  store i32 %324, i32* %yyn, align 4
  %325 = load i32* %yyn, align 4
  %326 = icmp eq i32 %325, -76
  br i1 %326, label %353, label %327

; <label>:327                                     ; preds = %319
  %328 = load i32* %yyn, align 4
  %329 = add nsw i32 %328, 1
  store i32 %329, i32* %yyn, align 4
  %330 = load i32* %yyn, align 4
  %331 = icmp sle i32 0, %330
  br i1 %331, label %332, label %352

; <label>:332                                     ; preds = %327
  %333 = load i32* %yyn, align 4
  %334 = icmp sle i32 %333, 251
  br i1 %334, label %335, label %352

; <label>:335                                     ; preds = %332
  %336 = load i32* %yyn, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [252 x i8]* @yycheck, i32 0, i64 %337
  %339 = load i8* %338, align 1
  %340 = zext i8 %339 to i32
  %341 = icmp eq i32 %340, 1
  br i1 %341, label %342, label %352

; <label>:342                                     ; preds = %335
  %343 = load i32* %yyn, align 4
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [252 x i16]* @yytable, i32 0, i64 %344
  %346 = load i16* %345, align 2
  %347 = sext i16 %346 to i32
  store i32 %347, i32* %yyn, align 4
  %348 = load i32* %yyn, align 4
  %349 = icmp slt i32 0, %348
  br i1 %349, label %350, label %351

; <label>:350                                     ; preds = %342
  br label %372

; <label>:351                                     ; preds = %342
  br label %352

; <label>:352                                     ; preds = %351, %335, %332, %327
  br label %353

; <label>:353                                     ; preds = %352, %319
  %354 = load i16** %yyssp, align 8
  %355 = load i16** %yyss, align 8
  %356 = icmp eq i16* %354, %355
  br i1 %356, label %357, label %358

; <label>:357                                     ; preds = %353
  br label %378

; <label>:358                                     ; preds = %353
  %359 = load i32* %yystate, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [148 x i8]* @yystos, i32 0, i64 %360
  %362 = load i8* %361, align 1
  %363 = zext i8 %362 to i32
  %364 = load i32** %yyvsp, align 8
  call void @yydestruct(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0), i32 %363, i32* %364)
  %365 = load i32** %yyvsp, align 8
  %366 = getelementptr inbounds i32* %365, i64 -1
  store i32* %366, i32** %yyvsp, align 8
  %367 = load i16** %yyssp, align 8
  %368 = getelementptr inbounds i16* %367, i64 -1
  store i16* %368, i16** %yyssp, align 8
  %369 = load i16** %yyssp, align 8
  %370 = load i16* %369, align 2
  %371 = sext i16 %370 to i32
  store i32 %371, i32* %yystate, align 4
  br label %319

; <label>:372                                     ; preds = %350
  %373 = load i32* @yylval, align 4
  %374 = load i32** %yyvsp, align 8
  %375 = getelementptr inbounds i32* %374, i32 1
  store i32* %375, i32** %yyvsp, align 8
  store i32 %373, i32* %375, align 4
  %376 = load i32* %yyn, align 4
  store i32 %376, i32* %yystate, align 4
  br label %3

; <label>:377                                     ; preds = %106
  store i32 0, i32* %yyresult, align 4
  br label %380

; <label>:378                                     ; preds = %357, %298, %101
  store i32 1, i32* %yyresult, align 4
  br label %380

; <label>:379                                     ; preds = %42, %26
  call void @yyerror(i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0))
  store i32 2, i32* %yyresult, align 4
  br label %380

; <label>:380                                     ; preds = %379, %378, %377
  %381 = load i32* @yychar, align 4
  %382 = icmp ne i32 %381, -2
  br i1 %382, label %383, label %396

; <label>:383                                     ; preds = %380
  %384 = load i32* @yychar, align 4
  %385 = icmp ule i32 %384, 279
  br i1 %385, label %386, label %392

; <label>:386                                     ; preds = %383
  %387 = load i32* @yychar, align 4
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds [280 x i8]* @yytranslate, i32 0, i64 %388
  %390 = load i8* %389, align 1
  %391 = zext i8 %390 to i32
  br label %393

; <label>:392                                     ; preds = %383
  br label %393

; <label>:393                                     ; preds = %392, %386
  %394 = phi i32 [ %391, %386 ], [ 2, %392 ]
  store i32 %394, i32* %yytoken, align 4
  %395 = load i32* %yytoken, align 4
  call void @yydestruct(i8* getelementptr inbounds ([30 x i8]* @.str5, i32 0, i32 0), i32 %395, i32* @yylval)
  br label %396

; <label>:396                                     ; preds = %393, %380
  %397 = load i32* %yylen, align 4
  %398 = load i32** %yyvsp, align 8
  %399 = sext i32 %397 to i64
  %400 = sub i64 0, %399
  %401 = getelementptr inbounds i32* %398, i64 %400
  store i32* %401, i32** %yyvsp, align 8
  %402 = load i32* %yylen, align 4
  %403 = load i16** %yyssp, align 8
  %404 = sext i32 %402 to i64
  %405 = sub i64 0, %404
  %406 = getelementptr inbounds i16* %403, i64 %405
  store i16* %406, i16** %yyssp, align 8
  br label %407

; <label>:407                                     ; preds = %411, %396
  %408 = load i16** %yyssp, align 8
  %409 = load i16** %yyss, align 8
  %410 = icmp ne i16* %408, %409
  br i1 %410, label %411, label %423

; <label>:411                                     ; preds = %407
  %412 = load i16** %yyssp, align 8
  %413 = load i16* %412, align 2
  %414 = sext i16 %413 to i64
  %415 = getelementptr inbounds [148 x i8]* @yystos, i32 0, i64 %414
  %416 = load i8* %415, align 1
  %417 = zext i8 %416 to i32
  %418 = load i32** %yyvsp, align 8
  call void @yydestruct(i8* getelementptr inbounds ([17 x i8]* @.str6, i32 0, i32 0), i32 %417, i32* %418)
  %419 = load i32** %yyvsp, align 8
  %420 = getelementptr inbounds i32* %419, i64 -1
  store i32* %420, i32** %yyvsp, align 8
  %421 = load i16** %yyssp, align 8
  %422 = getelementptr inbounds i16* %421, i64 -1
  store i16* %422, i16** %yyssp, align 8
  br label %407

; <label>:423                                     ; preds = %407
  %424 = load i16** %yyss, align 8
  %425 = getelementptr inbounds [200 x i16]* %yyssa, i32 0, i32 0
  %426 = icmp ne i16* %424, %425
  br i1 %426, label %427, label %430

; <label>:427                                     ; preds = %423
  %428 = load i16** %yyss, align 8
  %429 = bitcast i16* %428 to i8*
  call void @free(i8* %429) #2
  br label %430

; <label>:430                                     ; preds = %427, %423
  %431 = load i32* %yyresult, align 4
  ret i32 %431
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @yyerror(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = load i32* @yylineno, align 4
  %4 = load i8** %1, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), i32 %3, i8* %4)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @yydestruct(i8* %yymsg, i32 %yytype, i32* %yyvaluep) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  store i8* %yymsg, i8** %1, align 8
  store i32 %yytype, i32* %2, align 4
  store i32* %yyvaluep, i32** %3, align 8
  %4 = load i32** %3, align 8
  %5 = load i8** %1, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  store i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0), i8** %1, align 8
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = load i32* %2, align 4
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @yyparse()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @yylex() #0 {
  %1 = alloca i32, align 4
  %yy_current_state = alloca i32, align 4
  %yy_cp = alloca i8*, align 8
  %yy_bp = alloca i8*, align 8
  %yy_act = alloca i32, align 4
  %yy_c = alloca i8, align 1
  %yy_amount_of_matched_text = alloca i32, align 4
  %yy_next_state = alloca i32, align 4
  %2 = load i32* @yy_init, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %35, label %4

; <label>:4                                       ; preds = %0
  store i32 1, i32* @yy_init, align 4
  %5 = load i32* @yy_start, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %4
  store i32 1, i32* @yy_start, align 4
  br label %8

; <label>:8                                       ; preds = %7, %4
  %9 = load %struct._IO_FILE** @yyin, align 8
  %10 = icmp ne %struct._IO_FILE* %9, null
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %8
  %12 = load %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %12, %struct._IO_FILE** @yyin, align 8
  br label %13

; <label>:13                                      ; preds = %11, %8
  %14 = load %struct._IO_FILE** @yyout, align 8
  %15 = icmp ne %struct._IO_FILE* %14, null
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %13
  %17 = load %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %17, %struct._IO_FILE** @yyout, align 8
  br label %18

; <label>:18                                      ; preds = %16, %13
  %19 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %20 = icmp ne %struct.yy_buffer_state** %19, null
  br i1 %20, label %21, label %27

; <label>:21                                      ; preds = %18
  %22 = load i64* @yy_buffer_stack_top, align 8
  %23 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %24 = getelementptr inbounds %struct.yy_buffer_state** %23, i64 %22
  %25 = load %struct.yy_buffer_state** %24, align 8
  %26 = icmp ne %struct.yy_buffer_state* %25, null
  br i1 %26, label %34, label %28

; <label>:27                                      ; preds = %18
  br i1 false, label %34, label %28

; <label>:28                                      ; preds = %27, %21
  call void @yyensure_buffer_stack()
  %29 = load %struct._IO_FILE** @yyin, align 8
  %30 = call %struct.yy_buffer_state* @yy_create_buffer(%struct._IO_FILE* %29, i32 16384)
  %31 = load i64* @yy_buffer_stack_top, align 8
  %32 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %33 = getelementptr inbounds %struct.yy_buffer_state** %32, i64 %31
  store %struct.yy_buffer_state* %30, %struct.yy_buffer_state** %33, align 8
  br label %34

; <label>:34                                      ; preds = %28, %27, %21
  call void @yy_load_buffer_state()
  br label %35

; <label>:35                                      ; preds = %34, %0
  br label %36

; <label>:36                                      ; preds = %321, %35
  %37 = load i8** @yy_c_buf_p, align 8
  store i8* %37, i8** %yy_cp, align 8
  %38 = load i8* @yy_hold_char, align 1
  %39 = load i8** %yy_cp, align 8
  store i8 %38, i8* %39, align 1
  %40 = load i8** %yy_cp, align 8
  store i8* %40, i8** %yy_bp, align 8
  %41 = load i32* @yy_start, align 4
  store i32 %41, i32* %yy_current_state, align 4
  br label %42

; <label>:42                                      ; preds = %295, %269, %36
  br label %43

; <label>:43                                      ; preds = %106, %42
  %44 = load i8** %yy_cp, align 8
  %45 = load i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [256 x i32]* @yy_ec, i32 0, i64 %47
  %49 = load i32* %48, align 4
  %50 = trunc i32 %49 to i8
  store i8 %50, i8* %yy_c, align 1
  %51 = load i32* %yy_current_state, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [138 x i16]* @yy_accept, i32 0, i64 %52
  %54 = load i16* %53, align 2
  %55 = icmp ne i16 %54, 0
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %43
  %57 = load i32* %yy_current_state, align 4
  store i32 %57, i32* @yy_last_accepting_state, align 4
  %58 = load i8** %yy_cp, align 8
  store i8* %58, i8** @yy_last_accepting_cpos, align 8
  br label %59

; <label>:59                                      ; preds = %56, %43
  br label %60

; <label>:60                                      ; preds = %90, %59
  %61 = load i32* %yy_current_state, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %62
  %64 = load i16* %63, align 2
  %65 = sext i16 %64 to i32
  %66 = load i8* %yy_c, align 1
  %67 = zext i8 %66 to i32
  %68 = add nsw i32 %65, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [200 x i16]* @yy_chk, i32 0, i64 %69
  %71 = load i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = load i32* %yy_current_state, align 4
  %74 = icmp ne i32 %72, %73
  br i1 %74, label %75, label %91

; <label>:75                                      ; preds = %60
  %76 = load i32* %yy_current_state, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [141 x i16]* @yy_def, i32 0, i64 %77
  %79 = load i16* %78, align 2
  %80 = sext i16 %79 to i32
  store i32 %80, i32* %yy_current_state, align 4
  %81 = load i32* %yy_current_state, align 4
  %82 = icmp sge i32 %81, 138
  br i1 %82, label %83, label %90

; <label>:83                                      ; preds = %75
  %84 = load i8* %yy_c, align 1
  %85 = zext i8 %84 to i32
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds [48 x i32]* @yy_meta, i32 0, i64 %86
  %88 = load i32* %87, align 4
  %89 = trunc i32 %88 to i8
  store i8 %89, i8* %yy_c, align 1
  br label %90

; <label>:90                                      ; preds = %83, %75
  br label %60

; <label>:91                                      ; preds = %60
  %92 = load i32* %yy_current_state, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %93
  %95 = load i16* %94, align 2
  %96 = sext i16 %95 to i32
  %97 = load i8* %yy_c, align 1
  %98 = zext i8 %97 to i32
  %99 = add i32 %96, %98
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds [200 x i16]* @yy_nxt, i32 0, i64 %100
  %102 = load i16* %101, align 2
  %103 = sext i16 %102 to i32
  store i32 %103, i32* %yy_current_state, align 4
  %104 = load i8** %yy_cp, align 8
  %105 = getelementptr inbounds i8* %104, i32 1
  store i8* %105, i8** %yy_cp, align 8
  br label %106

; <label>:106                                     ; preds = %91
  %107 = load i32* %yy_current_state, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %108
  %110 = load i16* %109, align 2
  %111 = sext i16 %110 to i32
  %112 = icmp ne i32 %111, 152
  br i1 %112, label %43, label %113

; <label>:113                                     ; preds = %106
  br label %114

; <label>:114                                     ; preds = %304, %273, %144, %113
  %115 = load i32* %yy_current_state, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [138 x i16]* @yy_accept, i32 0, i64 %116
  %118 = load i16* %117, align 2
  %119 = sext i16 %118 to i32
  store i32 %119, i32* %yy_act, align 4
  %120 = load i32* %yy_act, align 4
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %130

; <label>:122                                     ; preds = %114
  %123 = load i8** @yy_last_accepting_cpos, align 8
  store i8* %123, i8** %yy_cp, align 8
  %124 = load i32* @yy_last_accepting_state, align 4
  store i32 %124, i32* %yy_current_state, align 4
  %125 = load i32* %yy_current_state, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [138 x i16]* @yy_accept, i32 0, i64 %126
  %128 = load i16* %127, align 2
  %129 = sext i16 %128 to i32
  store i32 %129, i32* %yy_act, align 4
  br label %130

; <label>:130                                     ; preds = %122, %114
  %131 = load i8** %yy_bp, align 8
  store i8* %131, i8** @yytext, align 8
  %132 = load i8** %yy_cp, align 8
  %133 = load i8** %yy_bp, align 8
  %134 = ptrtoint i8* %132 to i64
  %135 = ptrtoint i8* %133 to i64
  %136 = sub i64 %134, %135
  %137 = trunc i64 %136 to i32
  store i32 %137, i32* @yyleng, align 4
  %138 = load i8** %yy_cp, align 8
  %139 = load i8* %138, align 1
  store i8 %139, i8* @yy_hold_char, align 1
  %140 = load i8** %yy_cp, align 8
  store i8 0, i8* %140, align 1
  %141 = load i8** %yy_cp, align 8
  store i8* %141, i8** @yy_c_buf_p, align 8
  br label %142

; <label>:142                                     ; preds = %280, %130
  %143 = load i32* %yy_act, align 4
  switch i32 %143, label %320 [
    i32 0, label %144
    i32 1, label %149
    i32 2, label %150
    i32 3, label %151
    i32 4, label %152
    i32 5, label %153
    i32 6, label %154
    i32 7, label %155
    i32 8, label %156
    i32 9, label %157
    i32 10, label %158
    i32 11, label %159
    i32 12, label %160
    i32 13, label %161
    i32 14, label %162
    i32 15, label %163
    i32 16, label %164
    i32 17, label %165
    i32 18, label %166
    i32 19, label %167
    i32 20, label %168
    i32 21, label %169
    i32 22, label %170
    i32 23, label %171
    i32 24, label %172
    i32 25, label %173
    i32 26, label %174
    i32 27, label %175
    i32 28, label %176
    i32 29, label %177
    i32 30, label %178
    i32 31, label %179
    i32 32, label %180
    i32 33, label %181
    i32 34, label %182
    i32 35, label %183
    i32 36, label %184
    i32 37, label %185
    i32 38, label %186
    i32 39, label %189
    i32 40, label %192
    i32 41, label %193
    i32 42, label %196
    i32 43, label %198
    i32 45, label %209
    i32 44, label %210
  ]

; <label>:144                                     ; preds = %142
  %145 = load i8* @yy_hold_char, align 1
  %146 = load i8** %yy_cp, align 8
  store i8 %145, i8* %146, align 1
  %147 = load i8** @yy_last_accepting_cpos, align 8
  store i8* %147, i8** %yy_cp, align 8
  %148 = load i32* @yy_last_accepting_state, align 4
  store i32 %148, i32* %yy_current_state, align 4
  br label %114

; <label>:149                                     ; preds = %142
  call void @count()
  store i32 258, i32* %1
  br label %322

; <label>:150                                     ; preds = %142
  call void @count()
  store i32 259, i32* %1
  br label %322

; <label>:151                                     ; preds = %142
  call void @count()
  store i32 260, i32* %1
  br label %322

; <label>:152                                     ; preds = %142
  call void @count()
  store i32 261, i32* %1
  br label %322

; <label>:153                                     ; preds = %142
  call void @count()
  store i32 262, i32* %1
  br label %322

; <label>:154                                     ; preds = %142
  call void @count()
  store i32 263, i32* %1
  br label %322

; <label>:155                                     ; preds = %142
  call void @count()
  store i32 264, i32* %1
  br label %322

; <label>:156                                     ; preds = %142
  call void @count()
  store i32 265, i32* %1
  br label %322

; <label>:157                                     ; preds = %142
  call void @count()
  store i32 266, i32* %1
  br label %322

; <label>:158                                     ; preds = %142
  call void @count()
  store i32 267, i32* %1
  br label %322

; <label>:159                                     ; preds = %142
  call void @count()
  store i32 268, i32* %1
  br label %322

; <label>:160                                     ; preds = %142
  call void @count()
  store i32 269, i32* %1
  br label %322

; <label>:161                                     ; preds = %142
  call void @count()
  store i32 270, i32* %1
  br label %322

; <label>:162                                     ; preds = %142
  call void @count()
  store i32 271, i32* %1
  br label %322

; <label>:163                                     ; preds = %142
  call void @count()
  store i32 272, i32* %1
  br label %322

; <label>:164                                     ; preds = %142
  call void @count()
  store i32 273, i32* %1
  br label %322

; <label>:165                                     ; preds = %142
  call void @count()
  store i32 274, i32* %1
  br label %322

; <label>:166                                     ; preds = %142
  call void @count()
  store i32 275, i32* %1
  br label %322

; <label>:167                                     ; preds = %142
  call void @count()
  store i32 276, i32* %1
  br label %322

; <label>:168                                     ; preds = %142
  call void @count()
  store i32 277, i32* %1
  br label %322

; <label>:169                                     ; preds = %142
  call void @count()
  store i32 278, i32* %1
  br label %322

; <label>:170                                     ; preds = %142
  call void @count()
  store i32 279, i32* %1
  br label %322

; <label>:171                                     ; preds = %142
  call void @count()
  store i32 60, i32* %1
  br label %322

; <label>:172                                     ; preds = %142
  call void @count()
  store i32 43, i32* %1
  br label %322

; <label>:173                                     ; preds = %142
  call void @count()
  store i32 45, i32* %1
  br label %322

; <label>:174                                     ; preds = %142
  call void @count()
  store i32 42, i32* %1
  br label %322

; <label>:175                                     ; preds = %142
  call void @count()
  store i32 33, i32* %1
  br label %322

; <label>:176                                     ; preds = %142
  call void @count()
  store i32 61, i32* %1
  br label %322

; <label>:177                                     ; preds = %142
  call void @count()
  store i32 46, i32* %1
  br label %322

; <label>:178                                     ; preds = %142
  call void @count()
  store i32 40, i32* %1
  br label %322

; <label>:179                                     ; preds = %142
  call void @count()
  store i32 41, i32* %1
  br label %322

; <label>:180                                     ; preds = %142
  call void @count()
  store i32 91, i32* %1
  br label %322

; <label>:181                                     ; preds = %142
  call void @count()
  store i32 93, i32* %1
  br label %322

; <label>:182                                     ; preds = %142
  call void @count()
  store i32 123, i32* %1
  br label %322

; <label>:183                                     ; preds = %142
  call void @count()
  store i32 125, i32* %1
  br label %322

; <label>:184                                     ; preds = %142
  call void @count()
  store i32 44, i32* %1
  br label %322

; <label>:185                                     ; preds = %142
  call void @count()
  store i32 59, i32* %1
  br label %322

; <label>:186                                     ; preds = %142
  %187 = load i32* @yylineno, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* @yylineno, align 4
  br label %321

; <label>:189                                     ; preds = %142
  %190 = load i32* @yylineno, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* @yylineno, align 4
  br label %321

; <label>:192                                     ; preds = %142
  call void @count()
  br label %321

; <label>:193                                     ; preds = %142
  call void @count()
  %194 = load i32* @yylineno, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* @yylineno, align 4
  br label %321

; <label>:196                                     ; preds = %142
  %197 = call i32 (i8*, ...)* bitcast (void (i8*)* @yyerror to i32 (i8*, ...)*)(i8* getelementptr inbounds ([18 x i8]* @.str9, i32 0, i32 0))
  br label %321

; <label>:198                                     ; preds = %142
  br label %199

; <label>:199                                     ; preds = %198
  %200 = load i8** @yytext, align 8
  %201 = load i32* @yyleng, align 4
  %202 = sext i32 %201 to i64
  %203 = load %struct._IO_FILE** @yyout, align 8
  %204 = call i64 @fwrite(i8* %200, i64 %202, i64 1, %struct._IO_FILE* %203)
  %205 = icmp ne i64 %204, 0
  br i1 %205, label %206, label %207

; <label>:206                                     ; preds = %199
  br label %207

; <label>:207                                     ; preds = %206, %199
  br label %208

; <label>:208                                     ; preds = %207
  br label %321

; <label>:209                                     ; preds = %142
  store i32 0, i32* %1
  br label %322

; <label>:210                                     ; preds = %142
  %211 = load i8** %yy_cp, align 8
  %212 = load i8** @yytext, align 8
  %213 = ptrtoint i8* %211 to i64
  %214 = ptrtoint i8* %212 to i64
  %215 = sub i64 %213, %214
  %216 = trunc i64 %215 to i32
  %217 = sub nsw i32 %216, 1
  store i32 %217, i32* %yy_amount_of_matched_text, align 4
  %218 = load i8* @yy_hold_char, align 1
  %219 = load i8** %yy_cp, align 8
  store i8 %218, i8* %219, align 1
  %220 = load i64* @yy_buffer_stack_top, align 8
  %221 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %222 = getelementptr inbounds %struct.yy_buffer_state** %221, i64 %220
  %223 = load %struct.yy_buffer_state** %222, align 8
  %224 = getelementptr inbounds %struct.yy_buffer_state* %223, i32 0, i32 11
  %225 = load i32* %224, align 4
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %227, label %245

; <label>:227                                     ; preds = %210
  %228 = load i64* @yy_buffer_stack_top, align 8
  %229 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %230 = getelementptr inbounds %struct.yy_buffer_state** %229, i64 %228
  %231 = load %struct.yy_buffer_state** %230, align 8
  %232 = getelementptr inbounds %struct.yy_buffer_state* %231, i32 0, i32 4
  %233 = load i32* %232, align 4
  store i32 %233, i32* @yy_n_chars, align 4
  %234 = load %struct._IO_FILE** @yyin, align 8
  %235 = load i64* @yy_buffer_stack_top, align 8
  %236 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %237 = getelementptr inbounds %struct.yy_buffer_state** %236, i64 %235
  %238 = load %struct.yy_buffer_state** %237, align 8
  %239 = getelementptr inbounds %struct.yy_buffer_state* %238, i32 0, i32 0
  store %struct._IO_FILE* %234, %struct._IO_FILE** %239, align 8
  %240 = load i64* @yy_buffer_stack_top, align 8
  %241 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %242 = getelementptr inbounds %struct.yy_buffer_state** %241, i64 %240
  %243 = load %struct.yy_buffer_state** %242, align 8
  %244 = getelementptr inbounds %struct.yy_buffer_state* %243, i32 0, i32 11
  store i32 1, i32* %244, align 4
  br label %245

; <label>:245                                     ; preds = %227, %210
  %246 = load i8** @yy_c_buf_p, align 8
  %247 = load i32* @yy_n_chars, align 4
  %248 = sext i32 %247 to i64
  %249 = load i64* @yy_buffer_stack_top, align 8
  %250 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %251 = getelementptr inbounds %struct.yy_buffer_state** %250, i64 %249
  %252 = load %struct.yy_buffer_state** %251, align 8
  %253 = getelementptr inbounds %struct.yy_buffer_state* %252, i32 0, i32 1
  %254 = load i8** %253, align 8
  %255 = getelementptr inbounds i8* %254, i64 %248
  %256 = icmp ule i8* %246, %255
  br i1 %256, label %257, label %275

; <label>:257                                     ; preds = %245
  %258 = load i8** @yytext, align 8
  %259 = load i32* %yy_amount_of_matched_text, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds i8* %258, i64 %260
  store i8* %261, i8** @yy_c_buf_p, align 8
  %262 = call i32 @yy_get_previous_state()
  store i32 %262, i32* %yy_current_state, align 4
  %263 = load i32* %yy_current_state, align 4
  %264 = call i32 @yy_try_NUL_trans(i32 %263)
  store i32 %264, i32* %yy_next_state, align 4
  %265 = load i8** @yytext, align 8
  %266 = getelementptr inbounds i8* %265, i64 0
  store i8* %266, i8** %yy_bp, align 8
  %267 = load i32* %yy_next_state, align 4
  %268 = icmp ne i32 %267, 0
  br i1 %268, label %269, label %273

; <label>:269                                     ; preds = %257
  %270 = load i8** @yy_c_buf_p, align 8
  %271 = getelementptr inbounds i8* %270, i32 1
  store i8* %271, i8** @yy_c_buf_p, align 8
  store i8* %271, i8** %yy_cp, align 8
  %272 = load i32* %yy_next_state, align 4
  store i32 %272, i32* %yy_current_state, align 4
  br label %42

; <label>:273                                     ; preds = %257
  %274 = load i8** @yy_c_buf_p, align 8
  store i8* %274, i8** %yy_cp, align 8
  br label %114

; <label>:275                                     ; preds = %245
  %276 = call i32 @yy_get_next_buffer()
  switch i32 %276, label %318 [
    i32 1, label %277
    i32 0, label %295
    i32 2, label %304
  ]

; <label>:277                                     ; preds = %275
  store i32 0, i32* @yy_did_buffer_switch_on_eof, align 4
  %278 = call i32 @yywrap()
  %279 = icmp ne i32 %278, 0
  br i1 %279, label %280, label %288

; <label>:280                                     ; preds = %277
  %281 = load i8** @yytext, align 8
  %282 = getelementptr inbounds i8* %281, i64 0
  store i8* %282, i8** @yy_c_buf_p, align 8
  %283 = load i32* @yy_start, align 4
  %284 = sub nsw i32 %283, 1
  %285 = sdiv i32 %284, 2
  %286 = add nsw i32 44, %285
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %yy_act, align 4
  br label %142

; <label>:288                                     ; preds = %277
  %289 = load i32* @yy_did_buffer_switch_on_eof, align 4
  %290 = icmp ne i32 %289, 0
  br i1 %290, label %293, label %291

; <label>:291                                     ; preds = %288
  %292 = load %struct._IO_FILE** @yyin, align 8
  call void @yyrestart(%struct._IO_FILE* %292)
  br label %293

; <label>:293                                     ; preds = %291, %288
  br label %294

; <label>:294                                     ; preds = %293
  br label %318

; <label>:295                                     ; preds = %275
  %296 = load i8** @yytext, align 8
  %297 = load i32* %yy_amount_of_matched_text, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds i8* %296, i64 %298
  store i8* %299, i8** @yy_c_buf_p, align 8
  %300 = call i32 @yy_get_previous_state()
  store i32 %300, i32* %yy_current_state, align 4
  %301 = load i8** @yy_c_buf_p, align 8
  store i8* %301, i8** %yy_cp, align 8
  %302 = load i8** @yytext, align 8
  %303 = getelementptr inbounds i8* %302, i64 0
  store i8* %303, i8** %yy_bp, align 8
  br label %42

; <label>:304                                     ; preds = %275
  %305 = load i32* @yy_n_chars, align 4
  %306 = sext i32 %305 to i64
  %307 = load i64* @yy_buffer_stack_top, align 8
  %308 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %309 = getelementptr inbounds %struct.yy_buffer_state** %308, i64 %307
  %310 = load %struct.yy_buffer_state** %309, align 8
  %311 = getelementptr inbounds %struct.yy_buffer_state* %310, i32 0, i32 1
  %312 = load i8** %311, align 8
  %313 = getelementptr inbounds i8* %312, i64 %306
  store i8* %313, i8** @yy_c_buf_p, align 8
  %314 = call i32 @yy_get_previous_state()
  store i32 %314, i32* %yy_current_state, align 4
  %315 = load i8** @yy_c_buf_p, align 8
  store i8* %315, i8** %yy_cp, align 8
  %316 = load i8** @yytext, align 8
  %317 = getelementptr inbounds i8* %316, i64 0
  store i8* %317, i8** %yy_bp, align 8
  br label %114

; <label>:318                                     ; preds = %294, %275
  br label %319

; <label>:319                                     ; preds = %318
  br label %321

; <label>:320                                     ; preds = %142
  call void @yy_fatal_error(i8* getelementptr inbounds ([51 x i8]* @.str110, i32 0, i32 0))
  br label %321

; <label>:321                                     ; preds = %320, %319, %208, %196, %193, %192, %189, %186
  br label %36

; <label>:322                                     ; preds = %209, %185, %184, %183, %182, %181, %180, %179, %178, %177, %176, %175, %174, %173, %172, %171, %170, %169, %168, %167, %166, %165, %164, %163, %162, %161, %160, %159, %158, %157, %156, %155, %154, %153, %152, %151, %150, %149
  %323 = load i32* %1
  ret i32 %323
}

; Function Attrs: nounwind uwtable
define %struct.yy_buffer_state* @yy_create_buffer(%struct._IO_FILE* %file, i32 %size) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %2 = alloca i32, align 4
  %b = alloca %struct.yy_buffer_state*, align 8
  store %struct._IO_FILE* %file, %struct._IO_FILE** %1, align 8
  store i32 %size, i32* %2, align 4
  %3 = call i8* @yyalloc(i64 64)
  %4 = bitcast i8* %3 to %struct.yy_buffer_state*
  store %struct.yy_buffer_state* %4, %struct.yy_buffer_state** %b, align 8
  %5 = load %struct.yy_buffer_state** %b, align 8
  %6 = icmp ne %struct.yy_buffer_state* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  call void @yy_fatal_error(i8* getelementptr inbounds ([44 x i8]* @.str211, i32 0, i32 0))
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = load i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.yy_buffer_state** %b, align 8
  %12 = getelementptr inbounds %struct.yy_buffer_state* %11, i32 0, i32 3
  store i64 %10, i64* %12, align 8
  %13 = load %struct.yy_buffer_state** %b, align 8
  %14 = getelementptr inbounds %struct.yy_buffer_state* %13, i32 0, i32 3
  %15 = load i64* %14, align 8
  %16 = add i64 %15, 2
  %17 = call i8* @yyalloc(i64 %16)
  %18 = load %struct.yy_buffer_state** %b, align 8
  %19 = getelementptr inbounds %struct.yy_buffer_state* %18, i32 0, i32 1
  store i8* %17, i8** %19, align 8
  %20 = load %struct.yy_buffer_state** %b, align 8
  %21 = getelementptr inbounds %struct.yy_buffer_state* %20, i32 0, i32 1
  %22 = load i8** %21, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %25, label %24

; <label>:24                                      ; preds = %8
  call void @yy_fatal_error(i8* getelementptr inbounds ([44 x i8]* @.str211, i32 0, i32 0))
  br label %25

; <label>:25                                      ; preds = %24, %8
  %26 = load %struct.yy_buffer_state** %b, align 8
  %27 = getelementptr inbounds %struct.yy_buffer_state* %26, i32 0, i32 5
  store i32 1, i32* %27, align 4
  %28 = load %struct.yy_buffer_state** %b, align 8
  %29 = load %struct._IO_FILE** %1, align 8
  call void @yy_init_buffer(%struct.yy_buffer_state* %28, %struct._IO_FILE* %29)
  %30 = load %struct.yy_buffer_state** %b, align 8
  ret %struct.yy_buffer_state* %30
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i32 @yywrap() #0 {
  ret i32 1
}

; Function Attrs: nounwind uwtable
define void @yyrestart(%struct._IO_FILE* %input_file) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %input_file, %struct._IO_FILE** %1, align 8
  %2 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %3 = icmp ne %struct.yy_buffer_state** %2, null
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %0
  %5 = load i64* @yy_buffer_stack_top, align 8
  %6 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %7 = getelementptr inbounds %struct.yy_buffer_state** %6, i64 %5
  %8 = load %struct.yy_buffer_state** %7, align 8
  %9 = icmp ne %struct.yy_buffer_state* %8, null
  br i1 %9, label %17, label %11

; <label>:10                                      ; preds = %0
  br i1 false, label %17, label %11

; <label>:11                                      ; preds = %10, %4
  call void @yyensure_buffer_stack()
  %12 = load %struct._IO_FILE** @yyin, align 8
  %13 = call %struct.yy_buffer_state* @yy_create_buffer(%struct._IO_FILE* %12, i32 16384)
  %14 = load i64* @yy_buffer_stack_top, align 8
  %15 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %16 = getelementptr inbounds %struct.yy_buffer_state** %15, i64 %14
  store %struct.yy_buffer_state* %13, %struct.yy_buffer_state** %16, align 8
  br label %17

; <label>:17                                      ; preds = %11, %10, %4
  %18 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %19 = icmp ne %struct.yy_buffer_state** %18, null
  br i1 %19, label %20, label %25

; <label>:20                                      ; preds = %17
  %21 = load i64* @yy_buffer_stack_top, align 8
  %22 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %23 = getelementptr inbounds %struct.yy_buffer_state** %22, i64 %21
  %24 = load %struct.yy_buffer_state** %23, align 8
  br label %26

; <label>:25                                      ; preds = %17
  br label %26

; <label>:26                                      ; preds = %25, %20
  %27 = phi %struct.yy_buffer_state* [ %24, %20 ], [ null, %25 ]
  %28 = load %struct._IO_FILE** %1, align 8
  call void @yy_init_buffer(%struct.yy_buffer_state* %27, %struct._IO_FILE* %28)
  call void @yy_load_buffer_state()
  ret void
}

; Function Attrs: nounwind uwtable
define void @yy_switch_to_buffer(%struct.yy_buffer_state* %new_buffer) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  store %struct.yy_buffer_state* %new_buffer, %struct.yy_buffer_state** %1, align 8
  call void @yyensure_buffer_stack()
  %2 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %3 = icmp ne %struct.yy_buffer_state** %2, null
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = load i64* @yy_buffer_stack_top, align 8
  %6 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %7 = getelementptr inbounds %struct.yy_buffer_state** %6, i64 %5
  %8 = load %struct.yy_buffer_state** %7, align 8
  br label %10

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9, %4
  %11 = phi %struct.yy_buffer_state* [ %8, %4 ], [ null, %9 ]
  %12 = load %struct.yy_buffer_state** %1, align 8
  %13 = icmp eq %struct.yy_buffer_state* %11, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  br label %45

; <label>:15                                      ; preds = %10
  %16 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %17 = icmp ne %struct.yy_buffer_state** %16, null
  br i1 %17, label %18, label %24

; <label>:18                                      ; preds = %15
  %19 = load i64* @yy_buffer_stack_top, align 8
  %20 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %21 = getelementptr inbounds %struct.yy_buffer_state** %20, i64 %19
  %22 = load %struct.yy_buffer_state** %21, align 8
  %23 = icmp ne %struct.yy_buffer_state* %22, null
  br i1 %23, label %25, label %40

; <label>:24                                      ; preds = %15
  br i1 false, label %25, label %40

; <label>:25                                      ; preds = %24, %18
  %26 = load i8* @yy_hold_char, align 1
  %27 = load i8** @yy_c_buf_p, align 8
  store i8 %26, i8* %27, align 1
  %28 = load i8** @yy_c_buf_p, align 8
  %29 = load i64* @yy_buffer_stack_top, align 8
  %30 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %31 = getelementptr inbounds %struct.yy_buffer_state** %30, i64 %29
  %32 = load %struct.yy_buffer_state** %31, align 8
  %33 = getelementptr inbounds %struct.yy_buffer_state* %32, i32 0, i32 2
  store i8* %28, i8** %33, align 8
  %34 = load i32* @yy_n_chars, align 4
  %35 = load i64* @yy_buffer_stack_top, align 8
  %36 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %37 = getelementptr inbounds %struct.yy_buffer_state** %36, i64 %35
  %38 = load %struct.yy_buffer_state** %37, align 8
  %39 = getelementptr inbounds %struct.yy_buffer_state* %38, i32 0, i32 4
  store i32 %34, i32* %39, align 4
  br label %40

; <label>:40                                      ; preds = %25, %24, %18
  %41 = load %struct.yy_buffer_state** %1, align 8
  %42 = load i64* @yy_buffer_stack_top, align 8
  %43 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %44 = getelementptr inbounds %struct.yy_buffer_state** %43, i64 %42
  store %struct.yy_buffer_state* %41, %struct.yy_buffer_state** %44, align 8
  call void @yy_load_buffer_state()
  store i32 1, i32* @yy_did_buffer_switch_on_eof, align 4
  br label %45

; <label>:45                                      ; preds = %40, %14
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @yyalloc(i64 %size) #0 {
  %1 = alloca i64, align 8
  store i64 %size, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = call noalias i8* @malloc(i64 %2) #2
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define void @yy_delete_buffer(%struct.yy_buffer_state* %b) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  store %struct.yy_buffer_state* %b, %struct.yy_buffer_state** %1, align 8
  %2 = load %struct.yy_buffer_state** %1, align 8
  %3 = icmp ne %struct.yy_buffer_state* %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  br label %34

; <label>:5                                       ; preds = %0
  %6 = load %struct.yy_buffer_state** %1, align 8
  %7 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %8 = icmp ne %struct.yy_buffer_state** %7, null
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %5
  %10 = load i64* @yy_buffer_stack_top, align 8
  %11 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %12 = getelementptr inbounds %struct.yy_buffer_state** %11, i64 %10
  %13 = load %struct.yy_buffer_state** %12, align 8
  br label %15

; <label>:14                                      ; preds = %5
  br label %15

; <label>:15                                      ; preds = %14, %9
  %16 = phi %struct.yy_buffer_state* [ %13, %9 ], [ null, %14 ]
  %17 = icmp eq %struct.yy_buffer_state* %6, %16
  br i1 %17, label %18, label %22

; <label>:18                                      ; preds = %15
  %19 = load i64* @yy_buffer_stack_top, align 8
  %20 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %21 = getelementptr inbounds %struct.yy_buffer_state** %20, i64 %19
  store %struct.yy_buffer_state* null, %struct.yy_buffer_state** %21, align 8
  br label %22

; <label>:22                                      ; preds = %18, %15
  %23 = load %struct.yy_buffer_state** %1, align 8
  %24 = getelementptr inbounds %struct.yy_buffer_state* %23, i32 0, i32 5
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27                                      ; preds = %22
  %28 = load %struct.yy_buffer_state** %1, align 8
  %29 = getelementptr inbounds %struct.yy_buffer_state* %28, i32 0, i32 1
  %30 = load i8** %29, align 8
  call void @yyfree(i8* %30)
  br label %31

; <label>:31                                      ; preds = %27, %22
  %32 = load %struct.yy_buffer_state** %1, align 8
  %33 = bitcast %struct.yy_buffer_state* %32 to i8*
  call void @yyfree(i8* %33)
  br label %34

; <label>:34                                      ; preds = %31, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @yyfree(i8* %ptr) #0 {
  %1 = alloca i8*, align 8
  store i8* %ptr, i8** %1, align 8
  %2 = load i8** %1, align 8
  call void @free(i8* %2) #2
  ret void
}

; Function Attrs: nounwind uwtable
define void @yy_flush_buffer(%struct.yy_buffer_state* %b) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  store %struct.yy_buffer_state* %b, %struct.yy_buffer_state** %1, align 8
  %2 = load %struct.yy_buffer_state** %1, align 8
  %3 = icmp ne %struct.yy_buffer_state* %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  br label %39

; <label>:5                                       ; preds = %0
  %6 = load %struct.yy_buffer_state** %1, align 8
  %7 = getelementptr inbounds %struct.yy_buffer_state* %6, i32 0, i32 4
  store i32 0, i32* %7, align 4
  %8 = load %struct.yy_buffer_state** %1, align 8
  %9 = getelementptr inbounds %struct.yy_buffer_state* %8, i32 0, i32 1
  %10 = load i8** %9, align 8
  %11 = getelementptr inbounds i8* %10, i64 0
  store i8 0, i8* %11, align 1
  %12 = load %struct.yy_buffer_state** %1, align 8
  %13 = getelementptr inbounds %struct.yy_buffer_state* %12, i32 0, i32 1
  %14 = load i8** %13, align 8
  %15 = getelementptr inbounds i8* %14, i64 1
  store i8 0, i8* %15, align 1
  %16 = load %struct.yy_buffer_state** %1, align 8
  %17 = getelementptr inbounds %struct.yy_buffer_state* %16, i32 0, i32 1
  %18 = load i8** %17, align 8
  %19 = getelementptr inbounds i8* %18, i64 0
  %20 = load %struct.yy_buffer_state** %1, align 8
  %21 = getelementptr inbounds %struct.yy_buffer_state* %20, i32 0, i32 2
  store i8* %19, i8** %21, align 8
  %22 = load %struct.yy_buffer_state** %1, align 8
  %23 = getelementptr inbounds %struct.yy_buffer_state* %22, i32 0, i32 7
  store i32 1, i32* %23, align 4
  %24 = load %struct.yy_buffer_state** %1, align 8
  %25 = getelementptr inbounds %struct.yy_buffer_state* %24, i32 0, i32 11
  store i32 0, i32* %25, align 4
  %26 = load %struct.yy_buffer_state** %1, align 8
  %27 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %28 = icmp ne %struct.yy_buffer_state** %27, null
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %5
  %30 = load i64* @yy_buffer_stack_top, align 8
  %31 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %32 = getelementptr inbounds %struct.yy_buffer_state** %31, i64 %30
  %33 = load %struct.yy_buffer_state** %32, align 8
  br label %35

; <label>:34                                      ; preds = %5
  br label %35

; <label>:35                                      ; preds = %34, %29
  %36 = phi %struct.yy_buffer_state* [ %33, %29 ], [ null, %34 ]
  %37 = icmp eq %struct.yy_buffer_state* %26, %36
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %35
  call void @yy_load_buffer_state()
  br label %39

; <label>:39                                      ; preds = %38, %35, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @yypush_buffer_state(%struct.yy_buffer_state* %new_buffer) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  store %struct.yy_buffer_state* %new_buffer, %struct.yy_buffer_state** %1, align 8
  %2 = load %struct.yy_buffer_state** %1, align 8
  %3 = icmp eq %struct.yy_buffer_state* %2, null
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %48

; <label>:5                                       ; preds = %0
  call void @yyensure_buffer_stack()
  %6 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %7 = icmp ne %struct.yy_buffer_state** %6, null
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %5
  %9 = load i64* @yy_buffer_stack_top, align 8
  %10 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %11 = getelementptr inbounds %struct.yy_buffer_state** %10, i64 %9
  %12 = load %struct.yy_buffer_state** %11, align 8
  %13 = icmp ne %struct.yy_buffer_state* %12, null
  br i1 %13, label %15, label %30

; <label>:14                                      ; preds = %5
  br i1 false, label %15, label %30

; <label>:15                                      ; preds = %14, %8
  %16 = load i8* @yy_hold_char, align 1
  %17 = load i8** @yy_c_buf_p, align 8
  store i8 %16, i8* %17, align 1
  %18 = load i8** @yy_c_buf_p, align 8
  %19 = load i64* @yy_buffer_stack_top, align 8
  %20 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %21 = getelementptr inbounds %struct.yy_buffer_state** %20, i64 %19
  %22 = load %struct.yy_buffer_state** %21, align 8
  %23 = getelementptr inbounds %struct.yy_buffer_state* %22, i32 0, i32 2
  store i8* %18, i8** %23, align 8
  %24 = load i32* @yy_n_chars, align 4
  %25 = load i64* @yy_buffer_stack_top, align 8
  %26 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %27 = getelementptr inbounds %struct.yy_buffer_state** %26, i64 %25
  %28 = load %struct.yy_buffer_state** %27, align 8
  %29 = getelementptr inbounds %struct.yy_buffer_state* %28, i32 0, i32 4
  store i32 %24, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %15, %14, %8
  %31 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %32 = icmp ne %struct.yy_buffer_state** %31, null
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %30
  %34 = load i64* @yy_buffer_stack_top, align 8
  %35 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %36 = getelementptr inbounds %struct.yy_buffer_state** %35, i64 %34
  %37 = load %struct.yy_buffer_state** %36, align 8
  %38 = icmp ne %struct.yy_buffer_state* %37, null
  br i1 %38, label %40, label %43

; <label>:39                                      ; preds = %30
  br i1 false, label %40, label %43

; <label>:40                                      ; preds = %39, %33
  %41 = load i64* @yy_buffer_stack_top, align 8
  %42 = add i64 %41, 1
  store i64 %42, i64* @yy_buffer_stack_top, align 8
  br label %43

; <label>:43                                      ; preds = %40, %39, %33
  %44 = load %struct.yy_buffer_state** %1, align 8
  %45 = load i64* @yy_buffer_stack_top, align 8
  %46 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %47 = getelementptr inbounds %struct.yy_buffer_state** %46, i64 %45
  store %struct.yy_buffer_state* %44, %struct.yy_buffer_state** %47, align 8
  call void @yy_load_buffer_state()
  store i32 1, i32* @yy_did_buffer_switch_on_eof, align 4
  br label %48

; <label>:48                                      ; preds = %43, %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @yypop_buffer_state() #0 {
  %1 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %2 = icmp ne %struct.yy_buffer_state** %1, null
  br i1 %2, label %3, label %9

; <label>:3                                       ; preds = %0
  %4 = load i64* @yy_buffer_stack_top, align 8
  %5 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %6 = getelementptr inbounds %struct.yy_buffer_state** %5, i64 %4
  %7 = load %struct.yy_buffer_state** %6, align 8
  %8 = icmp ne %struct.yy_buffer_state* %7, null
  br i1 %8, label %11, label %10

; <label>:9                                       ; preds = %0
  br i1 false, label %11, label %10

; <label>:10                                      ; preds = %9, %3
  br label %41

; <label>:11                                      ; preds = %9, %3
  %12 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %13 = icmp ne %struct.yy_buffer_state** %12, null
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %11
  %15 = load i64* @yy_buffer_stack_top, align 8
  %16 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %17 = getelementptr inbounds %struct.yy_buffer_state** %16, i64 %15
  %18 = load %struct.yy_buffer_state** %17, align 8
  br label %20

; <label>:19                                      ; preds = %11
  br label %20

; <label>:20                                      ; preds = %19, %14
  %21 = phi %struct.yy_buffer_state* [ %18, %14 ], [ null, %19 ]
  call void @yy_delete_buffer(%struct.yy_buffer_state* %21)
  %22 = load i64* @yy_buffer_stack_top, align 8
  %23 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %24 = getelementptr inbounds %struct.yy_buffer_state** %23, i64 %22
  store %struct.yy_buffer_state* null, %struct.yy_buffer_state** %24, align 8
  %25 = load i64* @yy_buffer_stack_top, align 8
  %26 = icmp ugt i64 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %20
  %28 = load i64* @yy_buffer_stack_top, align 8
  %29 = add i64 %28, -1
  store i64 %29, i64* @yy_buffer_stack_top, align 8
  br label %30

; <label>:30                                      ; preds = %27, %20
  %31 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %32 = icmp ne %struct.yy_buffer_state** %31, null
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %30
  %34 = load i64* @yy_buffer_stack_top, align 8
  %35 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %36 = getelementptr inbounds %struct.yy_buffer_state** %35, i64 %34
  %37 = load %struct.yy_buffer_state** %36, align 8
  %38 = icmp ne %struct.yy_buffer_state* %37, null
  br i1 %38, label %40, label %41

; <label>:39                                      ; preds = %30
  br i1 false, label %40, label %41

; <label>:40                                      ; preds = %39, %33
  call void @yy_load_buffer_state()
  store i32 1, i32* @yy_did_buffer_switch_on_eof, align 4
  br label %41

; <label>:41                                      ; preds = %40, %39, %33, %10
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.yy_buffer_state* @yy_scan_buffer(i8* %base, i64 %size) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  %b = alloca %struct.yy_buffer_state*, align 8
  store i8* %base, i8** %2, align 8
  store i64 %size, i64* %3, align 8
  %4 = load i64* %3, align 8
  %5 = icmp ult i64 %4, 2
  br i1 %5, label %22, label %6

; <label>:6                                       ; preds = %0
  %7 = load i64* %3, align 8
  %8 = sub i64 %7, 2
  %9 = load i8** %2, align 8
  %10 = getelementptr inbounds i8* %9, i64 %8
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %22, label %14

; <label>:14                                      ; preds = %6
  %15 = load i64* %3, align 8
  %16 = sub i64 %15, 1
  %17 = load i8** %2, align 8
  %18 = getelementptr inbounds i8* %17, i64 %16
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %14, %6, %0
  store %struct.yy_buffer_state* null, %struct.yy_buffer_state** %1
  br label %59

; <label>:23                                      ; preds = %14
  %24 = call i8* @yyalloc(i64 64)
  %25 = bitcast i8* %24 to %struct.yy_buffer_state*
  store %struct.yy_buffer_state* %25, %struct.yy_buffer_state** %b, align 8
  %26 = load %struct.yy_buffer_state** %b, align 8
  %27 = icmp ne %struct.yy_buffer_state* %26, null
  br i1 %27, label %29, label %28

; <label>:28                                      ; preds = %23
  call void @yy_fatal_error(i8* getelementptr inbounds ([42 x i8]* @.str312, i32 0, i32 0))
  br label %29

; <label>:29                                      ; preds = %28, %23
  %30 = load i64* %3, align 8
  %31 = sub i64 %30, 2
  %32 = load %struct.yy_buffer_state** %b, align 8
  %33 = getelementptr inbounds %struct.yy_buffer_state* %32, i32 0, i32 3
  store i64 %31, i64* %33, align 8
  %34 = load i8** %2, align 8
  %35 = load %struct.yy_buffer_state** %b, align 8
  %36 = getelementptr inbounds %struct.yy_buffer_state* %35, i32 0, i32 1
  store i8* %34, i8** %36, align 8
  %37 = load %struct.yy_buffer_state** %b, align 8
  %38 = getelementptr inbounds %struct.yy_buffer_state* %37, i32 0, i32 2
  store i8* %34, i8** %38, align 8
  %39 = load %struct.yy_buffer_state** %b, align 8
  %40 = getelementptr inbounds %struct.yy_buffer_state* %39, i32 0, i32 5
  store i32 0, i32* %40, align 4
  %41 = load %struct.yy_buffer_state** %b, align 8
  %42 = getelementptr inbounds %struct.yy_buffer_state* %41, i32 0, i32 0
  store %struct._IO_FILE* null, %struct._IO_FILE** %42, align 8
  %43 = load %struct.yy_buffer_state** %b, align 8
  %44 = getelementptr inbounds %struct.yy_buffer_state* %43, i32 0, i32 3
  %45 = load i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = load %struct.yy_buffer_state** %b, align 8
  %48 = getelementptr inbounds %struct.yy_buffer_state* %47, i32 0, i32 4
  store i32 %46, i32* %48, align 4
  %49 = load %struct.yy_buffer_state** %b, align 8
  %50 = getelementptr inbounds %struct.yy_buffer_state* %49, i32 0, i32 6
  store i32 0, i32* %50, align 4
  %51 = load %struct.yy_buffer_state** %b, align 8
  %52 = getelementptr inbounds %struct.yy_buffer_state* %51, i32 0, i32 7
  store i32 1, i32* %52, align 4
  %53 = load %struct.yy_buffer_state** %b, align 8
  %54 = getelementptr inbounds %struct.yy_buffer_state* %53, i32 0, i32 10
  store i32 0, i32* %54, align 4
  %55 = load %struct.yy_buffer_state** %b, align 8
  %56 = getelementptr inbounds %struct.yy_buffer_state* %55, i32 0, i32 11
  store i32 0, i32* %56, align 4
  %57 = load %struct.yy_buffer_state** %b, align 8
  call void @yy_switch_to_buffer(%struct.yy_buffer_state* %57)
  %58 = load %struct.yy_buffer_state** %b, align 8
  store %struct.yy_buffer_state* %58, %struct.yy_buffer_state** %1
  br label %59

; <label>:59                                      ; preds = %29, %22
  %60 = load %struct.yy_buffer_state** %1
  ret %struct.yy_buffer_state* %60
}

; Function Attrs: nounwind uwtable
define %struct.yy_buffer_state* @yy_scan_string(i8* %yystr) #0 {
  %1 = alloca i8*, align 8
  store i8* %yystr, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = load i8** %1, align 8
  %4 = call i64 @strlen(i8* %3) #7
  %5 = trunc i64 %4 to i32
  %6 = call %struct.yy_buffer_state* @yy_scan_bytes(i8* %2, i32 %5)
  ret %struct.yy_buffer_state* %6
}

; Function Attrs: nounwind uwtable
define %struct.yy_buffer_state* @yy_scan_bytes(i8* %yybytes, i32 %_yybytes_len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %b = alloca %struct.yy_buffer_state*, align 8
  %buf = alloca i8*, align 8
  %n = alloca i64, align 8
  %i = alloca i32, align 4
  store i8* %yybytes, i8** %1, align 8
  store i32 %_yybytes_len, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = add nsw i32 %3, 2
  %5 = sext i32 %4 to i64
  store i64 %5, i64* %n, align 8
  %6 = load i64* %n, align 8
  %7 = call i8* @yyalloc(i64 %6)
  store i8* %7, i8** %buf, align 8
  %8 = load i8** %buf, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %0
  call void @yy_fatal_error(i8* getelementptr inbounds ([41 x i8]* @.str413, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %10, %0
  store i32 0, i32* %i, align 4
  br label %12

; <label>:12                                      ; preds = %26, %11
  %13 = load i32* %i, align 4
  %14 = load i32* %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %29

; <label>:16                                      ; preds = %12
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load i8** %1, align 8
  %20 = getelementptr inbounds i8* %19, i64 %18
  %21 = load i8* %20, align 1
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = load i8** %buf, align 8
  %25 = getelementptr inbounds i8* %24, i64 %23
  store i8 %21, i8* %25, align 1
  br label %26

; <label>:26                                      ; preds = %16
  %27 = load i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %12

; <label>:29                                      ; preds = %12
  %30 = load i32* %2, align 4
  %31 = add nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = load i8** %buf, align 8
  %34 = getelementptr inbounds i8* %33, i64 %32
  store i8 0, i8* %34, align 1
  %35 = load i32* %2, align 4
  %36 = sext i32 %35 to i64
  %37 = load i8** %buf, align 8
  %38 = getelementptr inbounds i8* %37, i64 %36
  store i8 0, i8* %38, align 1
  %39 = load i8** %buf, align 8
  %40 = load i64* %n, align 8
  %41 = call %struct.yy_buffer_state* @yy_scan_buffer(i8* %39, i64 %40)
  store %struct.yy_buffer_state* %41, %struct.yy_buffer_state** %b, align 8
  %42 = load %struct.yy_buffer_state** %b, align 8
  %43 = icmp ne %struct.yy_buffer_state* %42, null
  br i1 %43, label %45, label %44

; <label>:44                                      ; preds = %29
  call void @yy_fatal_error(i8* getelementptr inbounds ([30 x i8]* @.str514, i32 0, i32 0))
  br label %45

; <label>:45                                      ; preds = %44, %29
  %46 = load %struct.yy_buffer_state** %b, align 8
  %47 = getelementptr inbounds %struct.yy_buffer_state* %46, i32 0, i32 5
  store i32 1, i32* %47, align 4
  %48 = load %struct.yy_buffer_state** %b, align 8
  ret %struct.yy_buffer_state* %48
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #4

; Function Attrs: nounwind uwtable
define i32 @yyget_lineno() #0 {
  %1 = load i32* @yylineno, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @yyget_in() #0 {
  %1 = load %struct._IO_FILE** @yyin, align 8
  ret %struct._IO_FILE* %1
}

; Function Attrs: nounwind uwtable
define %struct._IO_FILE* @yyget_out() #0 {
  %1 = load %struct._IO_FILE** @yyout, align 8
  ret %struct._IO_FILE* %1
}

; Function Attrs: nounwind uwtable
define i32 @yyget_leng() #0 {
  %1 = load i32* @yyleng, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i8* @yyget_text() #0 {
  %1 = load i8** @yytext, align 8
  ret i8* %1
}

; Function Attrs: nounwind uwtable
define void @yyset_lineno(i32 %line_number) #0 {
  %1 = alloca i32, align 4
  store i32 %line_number, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* @yylineno, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @yyset_in(%struct._IO_FILE* %in_str) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %in_str, %struct._IO_FILE** %1, align 8
  %2 = load %struct._IO_FILE** %1, align 8
  store %struct._IO_FILE* %2, %struct._IO_FILE** @yyin, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @yyset_out(%struct._IO_FILE* %out_str) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  store %struct._IO_FILE* %out_str, %struct._IO_FILE** %1, align 8
  %2 = load %struct._IO_FILE** %1, align 8
  store %struct._IO_FILE* %2, %struct._IO_FILE** @yyout, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @yyget_debug() #0 {
  %1 = load i32* @yy_flex_debug, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define void @yyset_debug(i32 %bdebug) #0 {
  %1 = alloca i32, align 4
  store i32 %bdebug, i32* %1, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* @yy_flex_debug, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @yylex_destroy() #0 {
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %3 = icmp ne %struct.yy_buffer_state** %2, null
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %1
  %5 = load i64* @yy_buffer_stack_top, align 8
  %6 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %7 = getelementptr inbounds %struct.yy_buffer_state** %6, i64 %5
  %8 = load %struct.yy_buffer_state** %7, align 8
  br label %10

; <label>:9                                       ; preds = %1
  br label %10

; <label>:10                                      ; preds = %9, %4
  %11 = phi %struct.yy_buffer_state* [ %8, %4 ], [ null, %9 ]
  %12 = icmp ne %struct.yy_buffer_state* %11, null
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %10
  %14 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %15 = icmp ne %struct.yy_buffer_state** %14, null
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %13
  %17 = load i64* @yy_buffer_stack_top, align 8
  %18 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %19 = getelementptr inbounds %struct.yy_buffer_state** %18, i64 %17
  %20 = load %struct.yy_buffer_state** %19, align 8
  br label %22

; <label>:21                                      ; preds = %13
  br label %22

; <label>:22                                      ; preds = %21, %16
  %23 = phi %struct.yy_buffer_state* [ %20, %16 ], [ null, %21 ]
  call void @yy_delete_buffer(%struct.yy_buffer_state* %23)
  %24 = load i64* @yy_buffer_stack_top, align 8
  %25 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %26 = getelementptr inbounds %struct.yy_buffer_state** %25, i64 %24
  store %struct.yy_buffer_state* null, %struct.yy_buffer_state** %26, align 8
  call void @yypop_buffer_state()
  br label %1

; <label>:27                                      ; preds = %10
  %28 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %29 = bitcast %struct.yy_buffer_state** %28 to i8*
  call void @yyfree(i8* %29)
  store %struct.yy_buffer_state** null, %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %30 = call i32 @yy_init_globals()
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i8* @yyrealloc(i8* %ptr, i64 %size) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  store i8* %ptr, i8** %1, align 8
  store i64 %size, i64* %2, align 8
  %3 = load i8** %1, align 8
  %4 = load i64* %2, align 8
  %5 = call i8* @realloc(i8* %3, i64 %4) #2
  ret i8* %5
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind uwtable
define void @count() #0 {
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %37, %0
  %2 = load i32* %i, align 4
  %3 = sext i32 %2 to i64
  %4 = load i8** @yytext, align 8
  %5 = getelementptr inbounds i8* %4, i64 %3
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %40

; <label>:9                                       ; preds = %1
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load i8** @yytext, align 8
  %13 = getelementptr inbounds i8* %12, i64 %11
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 10
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %9
  store i32 0, i32* @column, align 4
  br label %36

; <label>:18                                      ; preds = %9
  %19 = load i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = load i8** @yytext, align 8
  %22 = getelementptr inbounds i8* %21, i64 %20
  %23 = load i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 9
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %18
  %27 = load i32* @column, align 4
  %28 = srem i32 %27, 8
  %29 = sub nsw i32 8, %28
  %30 = load i32* @column, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, i32* @column, align 4
  br label %35

; <label>:32                                      ; preds = %18
  %33 = load i32* @column, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* @column, align 4
  br label %35

; <label>:35                                      ; preds = %32, %26
  br label %36

; <label>:36                                      ; preds = %35, %17
  br label %37

; <label>:37                                      ; preds = %36
  %38 = load i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %1

; <label>:40                                      ; preds = %1
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #6

; Function Attrs: nounwind
declare i32 @isatty(i32) #1

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #1

declare i32 @_IO_getc(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @clearerr(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define internal void @yyensure_buffer_stack() #0 {
  %num_to_alloc = alloca i32, align 4
  %grow_size = alloca i32, align 4
  %1 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %2 = icmp ne %struct.yy_buffer_state** %1, null
  br i1 %2, label %20, label %3

; <label>:3                                       ; preds = %0
  store i32 1, i32* %num_to_alloc, align 4
  %4 = load i32* %num_to_alloc, align 4
  %5 = sext i32 %4 to i64
  %6 = mul i64 %5, 8
  %7 = call i8* @yyalloc(i64 %6)
  %8 = bitcast i8* %7 to %struct.yy_buffer_state**
  store %struct.yy_buffer_state** %8, %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %9 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %10 = icmp ne %struct.yy_buffer_state** %9, null
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %3
  call void @yy_fatal_error(i8* getelementptr inbounds ([49 x i8]* @.str716, i32 0, i32 0))
  br label %12

; <label>:12                                      ; preds = %11, %3
  %13 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %14 = bitcast %struct.yy_buffer_state** %13 to i8*
  %15 = load i32* %num_to_alloc, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 8
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 %17, i32 8, i1 false)
  %18 = load i32* %num_to_alloc, align 4
  %19 = sext i32 %18 to i64
  store i64 %19, i64* @yy_buffer_stack_max, align 8
  store i64 0, i64* @yy_buffer_stack_top, align 8
  br label %51

; <label>:20                                      ; preds = %0
  %21 = load i64* @yy_buffer_stack_top, align 8
  %22 = load i64* @yy_buffer_stack_max, align 8
  %23 = sub i64 %22, 1
  %24 = icmp uge i64 %21, %23
  br i1 %24, label %25, label %51

; <label>:25                                      ; preds = %20
  store i32 8, i32* %grow_size, align 4
  %26 = load i64* @yy_buffer_stack_max, align 8
  %27 = load i32* %grow_size, align 4
  %28 = sext i32 %27 to i64
  %29 = add i64 %26, %28
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %num_to_alloc, align 4
  %31 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %32 = bitcast %struct.yy_buffer_state** %31 to i8*
  %33 = load i32* %num_to_alloc, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 8
  %36 = call i8* @yyrealloc(i8* %32, i64 %35)
  %37 = bitcast i8* %36 to %struct.yy_buffer_state**
  store %struct.yy_buffer_state** %37, %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %38 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %39 = icmp ne %struct.yy_buffer_state** %38, null
  br i1 %39, label %41, label %40

; <label>:40                                      ; preds = %25
  call void @yy_fatal_error(i8* getelementptr inbounds ([49 x i8]* @.str716, i32 0, i32 0))
  br label %41

; <label>:41                                      ; preds = %40, %25
  %42 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %43 = load i64* @yy_buffer_stack_max, align 8
  %44 = getelementptr inbounds %struct.yy_buffer_state** %42, i64 %43
  %45 = bitcast %struct.yy_buffer_state** %44 to i8*
  %46 = load i32* %grow_size, align 4
  %47 = sext i32 %46 to i64
  %48 = mul i64 %47, 8
  call void @llvm.memset.p0i8.i64(i8* %45, i8 0, i64 %48, i32 8, i1 false)
  %49 = load i32* %num_to_alloc, align 4
  %50 = sext i32 %49 to i64
  store i64 %50, i64* @yy_buffer_stack_max, align 8
  br label %51

; <label>:51                                      ; preds = %41, %20, %12
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @yy_load_buffer_state() #0 {
  %1 = load i64* @yy_buffer_stack_top, align 8
  %2 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %3 = getelementptr inbounds %struct.yy_buffer_state** %2, i64 %1
  %4 = load %struct.yy_buffer_state** %3, align 8
  %5 = getelementptr inbounds %struct.yy_buffer_state* %4, i32 0, i32 4
  %6 = load i32* %5, align 4
  store i32 %6, i32* @yy_n_chars, align 4
  %7 = load i64* @yy_buffer_stack_top, align 8
  %8 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %9 = getelementptr inbounds %struct.yy_buffer_state** %8, i64 %7
  %10 = load %struct.yy_buffer_state** %9, align 8
  %11 = getelementptr inbounds %struct.yy_buffer_state* %10, i32 0, i32 2
  %12 = load i8** %11, align 8
  store i8* %12, i8** @yy_c_buf_p, align 8
  store i8* %12, i8** @yytext, align 8
  %13 = load i64* @yy_buffer_stack_top, align 8
  %14 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %15 = getelementptr inbounds %struct.yy_buffer_state** %14, i64 %13
  %16 = load %struct.yy_buffer_state** %15, align 8
  %17 = getelementptr inbounds %struct.yy_buffer_state* %16, i32 0, i32 0
  %18 = load %struct._IO_FILE** %17, align 8
  store %struct._IO_FILE* %18, %struct._IO_FILE** @yyin, align 8
  %19 = load i8** @yy_c_buf_p, align 8
  %20 = load i8* %19, align 1
  store i8 %20, i8* @yy_hold_char, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @yy_get_previous_state() #0 {
  %yy_current_state = alloca i32, align 4
  %yy_cp = alloca i8*, align 8
  %yy_c = alloca i8, align 1
  %1 = load i32* @yy_start, align 4
  store i32 %1, i32* %yy_current_state, align 4
  %2 = load i8** @yytext, align 8
  %3 = getelementptr inbounds i8* %2, i64 0
  store i8* %3, i8** %yy_cp, align 8
  br label %4

; <label>:4                                       ; preds = %77, %0
  %5 = load i8** %yy_cp, align 8
  %6 = load i8** @yy_c_buf_p, align 8
  %7 = icmp ult i8* %5, %6
  br i1 %7, label %8, label %80

; <label>:8                                       ; preds = %4
  %9 = load i8** %yy_cp, align 8
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %20

; <label>:13                                      ; preds = %8
  %14 = load i8** %yy_cp, align 8
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds [256 x i32]* @yy_ec, i32 0, i64 %17
  %19 = load i32* %18, align 4
  br label %21

; <label>:20                                      ; preds = %8
  br label %21

; <label>:21                                      ; preds = %20, %13
  %22 = phi i32 [ %19, %13 ], [ 1, %20 ]
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %yy_c, align 1
  %24 = load i32* %yy_current_state, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [138 x i16]* @yy_accept, i32 0, i64 %25
  %27 = load i16* %26, align 2
  %28 = icmp ne i16 %27, 0
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %21
  %30 = load i32* %yy_current_state, align 4
  store i32 %30, i32* @yy_last_accepting_state, align 4
  %31 = load i8** %yy_cp, align 8
  store i8* %31, i8** @yy_last_accepting_cpos, align 8
  br label %32

; <label>:32                                      ; preds = %29, %21
  br label %33

; <label>:33                                      ; preds = %63, %32
  %34 = load i32* %yy_current_state, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %35
  %37 = load i16* %36, align 2
  %38 = sext i16 %37 to i32
  %39 = load i8* %yy_c, align 1
  %40 = zext i8 %39 to i32
  %41 = add nsw i32 %38, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [200 x i16]* @yy_chk, i32 0, i64 %42
  %44 = load i16* %43, align 2
  %45 = sext i16 %44 to i32
  %46 = load i32* %yy_current_state, align 4
  %47 = icmp ne i32 %45, %46
  br i1 %47, label %48, label %64

; <label>:48                                      ; preds = %33
  %49 = load i32* %yy_current_state, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [141 x i16]* @yy_def, i32 0, i64 %50
  %52 = load i16* %51, align 2
  %53 = sext i16 %52 to i32
  store i32 %53, i32* %yy_current_state, align 4
  %54 = load i32* %yy_current_state, align 4
  %55 = icmp sge i32 %54, 138
  br i1 %55, label %56, label %63

; <label>:56                                      ; preds = %48
  %57 = load i8* %yy_c, align 1
  %58 = zext i8 %57 to i32
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds [48 x i32]* @yy_meta, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = trunc i32 %61 to i8
  store i8 %62, i8* %yy_c, align 1
  br label %63

; <label>:63                                      ; preds = %56, %48
  br label %33

; <label>:64                                      ; preds = %33
  %65 = load i32* %yy_current_state, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %66
  %68 = load i16* %67, align 2
  %69 = sext i16 %68 to i32
  %70 = load i8* %yy_c, align 1
  %71 = zext i8 %70 to i32
  %72 = add i32 %69, %71
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds [200 x i16]* @yy_nxt, i32 0, i64 %73
  %75 = load i16* %74, align 2
  %76 = sext i16 %75 to i32
  store i32 %76, i32* %yy_current_state, align 4
  br label %77

; <label>:77                                      ; preds = %64
  %78 = load i8** %yy_cp, align 8
  %79 = getelementptr inbounds i8* %78, i32 1
  store i8* %79, i8** %yy_cp, align 8
  br label %4

; <label>:80                                      ; preds = %4
  %81 = load i32* %yy_current_state, align 4
  ret i32 %81
}

; Function Attrs: nounwind uwtable
define internal i32 @yy_try_NUL_trans(i32 %yy_current_state) #0 {
  %1 = alloca i32, align 4
  %yy_is_jam = alloca i32, align 4
  %yy_cp = alloca i8*, align 8
  %yy_c = alloca i8, align 1
  store i32 %yy_current_state, i32* %1, align 4
  %2 = load i8** @yy_c_buf_p, align 8
  store i8* %2, i8** %yy_cp, align 8
  store i8 1, i8* %yy_c, align 1
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [138 x i16]* @yy_accept, i32 0, i64 %4
  %6 = load i16* %5, align 2
  %7 = icmp ne i16 %6, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  store i32 %9, i32* @yy_last_accepting_state, align 4
  %10 = load i8** %yy_cp, align 8
  store i8* %10, i8** @yy_last_accepting_cpos, align 8
  br label %11

; <label>:11                                      ; preds = %8, %0
  br label %12

; <label>:12                                      ; preds = %42, %11
  %13 = load i32* %1, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %14
  %16 = load i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = load i8* %yy_c, align 1
  %19 = zext i8 %18 to i32
  %20 = add nsw i32 %17, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [200 x i16]* @yy_chk, i32 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = load i32* %1, align 4
  %26 = icmp ne i32 %24, %25
  br i1 %26, label %27, label %43

; <label>:27                                      ; preds = %12
  %28 = load i32* %1, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [141 x i16]* @yy_def, i32 0, i64 %29
  %31 = load i16* %30, align 2
  %32 = sext i16 %31 to i32
  store i32 %32, i32* %1, align 4
  %33 = load i32* %1, align 4
  %34 = icmp sge i32 %33, 138
  br i1 %34, label %35, label %42

; <label>:35                                      ; preds = %27
  %36 = load i8* %yy_c, align 1
  %37 = zext i8 %36 to i32
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [48 x i32]* @yy_meta, i32 0, i64 %38
  %40 = load i32* %39, align 4
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %yy_c, align 1
  br label %42

; <label>:42                                      ; preds = %35, %27
  br label %12

; <label>:43                                      ; preds = %12
  %44 = load i32* %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [141 x i16]* @yy_base, i32 0, i64 %45
  %47 = load i16* %46, align 2
  %48 = sext i16 %47 to i32
  %49 = load i8* %yy_c, align 1
  %50 = zext i8 %49 to i32
  %51 = add i32 %48, %50
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [200 x i16]* @yy_nxt, i32 0, i64 %52
  %54 = load i16* %53, align 2
  %55 = sext i16 %54 to i32
  store i32 %55, i32* %1, align 4
  %56 = load i32* %1, align 4
  %57 = icmp eq i32 %56, 137
  %58 = zext i1 %57 to i32
  store i32 %58, i32* %yy_is_jam, align 4
  %59 = load i32* %yy_is_jam, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %43
  br label %64

; <label>:62                                      ; preds = %43
  %63 = load i32* %1, align 4
  br label %64

; <label>:64                                      ; preds = %62, %61
  %65 = phi i32 [ 0, %61 ], [ %63, %62 ]
  ret i32 %65
}

; Function Attrs: nounwind uwtable
define internal i32 @yy_get_next_buffer() #0 {
  %1 = alloca i32, align 4
  %dest = alloca i8*, align 8
  %source = alloca i8*, align 8
  %number_to_move = alloca i32, align 4
  %i = alloca i32, align 4
  %ret_val = alloca i32, align 4
  %num_to_read = alloca i32, align 4
  %b = alloca %struct.yy_buffer_state*, align 8
  %yy_c_buf_p_offset = alloca i32, align 4
  %new_size = alloca i32, align 4
  %c = alloca i32, align 4
  %n = alloca i64, align 8
  %new_size1 = alloca i64, align 8
  %2 = load i64* @yy_buffer_stack_top, align 8
  %3 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %4 = getelementptr inbounds %struct.yy_buffer_state** %3, i64 %2
  %5 = load %struct.yy_buffer_state** %4, align 8
  %6 = getelementptr inbounds %struct.yy_buffer_state* %5, i32 0, i32 1
  %7 = load i8** %6, align 8
  store i8* %7, i8** %dest, align 8
  %8 = load i8** @yytext, align 8
  store i8* %8, i8** %source, align 8
  %9 = load i8** @yy_c_buf_p, align 8
  %10 = load i32* @yy_n_chars, align 4
  %11 = add nsw i32 %10, 1
  %12 = sext i32 %11 to i64
  %13 = load i64* @yy_buffer_stack_top, align 8
  %14 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %15 = getelementptr inbounds %struct.yy_buffer_state** %14, i64 %13
  %16 = load %struct.yy_buffer_state** %15, align 8
  %17 = getelementptr inbounds %struct.yy_buffer_state* %16, i32 0, i32 1
  %18 = load i8** %17, align 8
  %19 = getelementptr inbounds i8* %18, i64 %12
  %20 = icmp ugt i8* %9, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %0
  call void @yy_fatal_error(i8* getelementptr inbounds ([56 x i8]* @.str817, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %21, %0
  %23 = load i64* @yy_buffer_stack_top, align 8
  %24 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %25 = getelementptr inbounds %struct.yy_buffer_state** %24, i64 %23
  %26 = load %struct.yy_buffer_state** %25, align 8
  %27 = getelementptr inbounds %struct.yy_buffer_state* %26, i32 0, i32 10
  %28 = load i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %40

; <label>:30                                      ; preds = %22
  %31 = load i8** @yy_c_buf_p, align 8
  %32 = load i8** @yytext, align 8
  %33 = ptrtoint i8* %31 to i64
  %34 = ptrtoint i8* %32 to i64
  %35 = sub i64 %33, %34
  %36 = sub nsw i64 %35, 0
  %37 = icmp eq i64 %36, 1
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %30
  store i32 1, i32* %1
  br label %373

; <label>:39                                      ; preds = %30
  store i32 2, i32* %1
  br label %373

; <label>:40                                      ; preds = %22
  %41 = load i8** @yy_c_buf_p, align 8
  %42 = load i8** @yytext, align 8
  %43 = ptrtoint i8* %41 to i64
  %44 = ptrtoint i8* %42 to i64
  %45 = sub i64 %43, %44
  %46 = trunc i64 %45 to i32
  %47 = sub nsw i32 %46, 1
  store i32 %47, i32* %number_to_move, align 4
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %58, %40
  %49 = load i32* %i, align 4
  %50 = load i32* %number_to_move, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %61

; <label>:52                                      ; preds = %48
  %53 = load i8** %source, align 8
  %54 = getelementptr inbounds i8* %53, i32 1
  store i8* %54, i8** %source, align 8
  %55 = load i8* %53, align 1
  %56 = load i8** %dest, align 8
  %57 = getelementptr inbounds i8* %56, i32 1
  store i8* %57, i8** %dest, align 8
  store i8 %55, i8* %56, align 1
  br label %58

; <label>:58                                      ; preds = %52
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %48

; <label>:61                                      ; preds = %48
  %62 = load i64* @yy_buffer_stack_top, align 8
  %63 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %64 = getelementptr inbounds %struct.yy_buffer_state** %63, i64 %62
  %65 = load %struct.yy_buffer_state** %64, align 8
  %66 = getelementptr inbounds %struct.yy_buffer_state* %65, i32 0, i32 11
  %67 = load i32* %66, align 4
  %68 = icmp eq i32 %67, 2
  br i1 %68, label %69, label %75

; <label>:69                                      ; preds = %61
  store i32 0, i32* @yy_n_chars, align 4
  %70 = load i64* @yy_buffer_stack_top, align 8
  %71 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %72 = getelementptr inbounds %struct.yy_buffer_state** %71, i64 %70
  %73 = load %struct.yy_buffer_state** %72, align 8
  %74 = getelementptr inbounds %struct.yy_buffer_state* %73, i32 0, i32 4
  store i32 0, i32* %74, align 4
  br label %284

; <label>:75                                      ; preds = %61
  %76 = load i64* @yy_buffer_stack_top, align 8
  %77 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %78 = getelementptr inbounds %struct.yy_buffer_state** %77, i64 %76
  %79 = load %struct.yy_buffer_state** %78, align 8
  %80 = getelementptr inbounds %struct.yy_buffer_state* %79, i32 0, i32 3
  %81 = load i64* %80, align 8
  %82 = load i32* %number_to_move, align 4
  %83 = sext i32 %82 to i64
  %84 = sub i64 %81, %83
  %85 = sub i64 %84, 1
  %86 = trunc i64 %85 to i32
  store i32 %86, i32* %num_to_read, align 4
  br label %87

; <label>:87                                      ; preds = %155, %75
  %88 = load i32* %num_to_read, align 4
  %89 = icmp sle i32 %88, 0
  br i1 %89, label %90, label %173

; <label>:90                                      ; preds = %87
  %91 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %92 = icmp ne %struct.yy_buffer_state** %91, null
  br i1 %92, label %93, label %98

; <label>:93                                      ; preds = %90
  %94 = load i64* @yy_buffer_stack_top, align 8
  %95 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %96 = getelementptr inbounds %struct.yy_buffer_state** %95, i64 %94
  %97 = load %struct.yy_buffer_state** %96, align 8
  br label %99

; <label>:98                                      ; preds = %90
  br label %99

; <label>:99                                      ; preds = %98, %93
  %100 = phi %struct.yy_buffer_state* [ %97, %93 ], [ null, %98 ]
  store %struct.yy_buffer_state* %100, %struct.yy_buffer_state** %b, align 8
  %101 = load i8** @yy_c_buf_p, align 8
  %102 = load %struct.yy_buffer_state** %b, align 8
  %103 = getelementptr inbounds %struct.yy_buffer_state* %102, i32 0, i32 1
  %104 = load i8** %103, align 8
  %105 = ptrtoint i8* %101 to i64
  %106 = ptrtoint i8* %104 to i64
  %107 = sub i64 %105, %106
  %108 = trunc i64 %107 to i32
  store i32 %108, i32* %yy_c_buf_p_offset, align 4
  %109 = load %struct.yy_buffer_state** %b, align 8
  %110 = getelementptr inbounds %struct.yy_buffer_state* %109, i32 0, i32 5
  %111 = load i32* %110, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %146

; <label>:113                                     ; preds = %99
  %114 = load %struct.yy_buffer_state** %b, align 8
  %115 = getelementptr inbounds %struct.yy_buffer_state* %114, i32 0, i32 3
  %116 = load i64* %115, align 8
  %117 = mul i64 %116, 2
  %118 = trunc i64 %117 to i32
  store i32 %118, i32* %new_size, align 4
  %119 = load i32* %new_size, align 4
  %120 = icmp sle i32 %119, 0
  br i1 %120, label %121, label %130

; <label>:121                                     ; preds = %113
  %122 = load %struct.yy_buffer_state** %b, align 8
  %123 = getelementptr inbounds %struct.yy_buffer_state* %122, i32 0, i32 3
  %124 = load i64* %123, align 8
  %125 = udiv i64 %124, 8
  %126 = load %struct.yy_buffer_state** %b, align 8
  %127 = getelementptr inbounds %struct.yy_buffer_state* %126, i32 0, i32 3
  %128 = load i64* %127, align 8
  %129 = add i64 %128, %125
  store i64 %129, i64* %127, align 8
  br label %135

; <label>:130                                     ; preds = %113
  %131 = load %struct.yy_buffer_state** %b, align 8
  %132 = getelementptr inbounds %struct.yy_buffer_state* %131, i32 0, i32 3
  %133 = load i64* %132, align 8
  %134 = mul i64 %133, 2
  store i64 %134, i64* %132, align 8
  br label %135

; <label>:135                                     ; preds = %130, %121
  %136 = load %struct.yy_buffer_state** %b, align 8
  %137 = getelementptr inbounds %struct.yy_buffer_state* %136, i32 0, i32 1
  %138 = load i8** %137, align 8
  %139 = load %struct.yy_buffer_state** %b, align 8
  %140 = getelementptr inbounds %struct.yy_buffer_state* %139, i32 0, i32 3
  %141 = load i64* %140, align 8
  %142 = add i64 %141, 2
  %143 = call i8* @yyrealloc(i8* %138, i64 %142)
  %144 = load %struct.yy_buffer_state** %b, align 8
  %145 = getelementptr inbounds %struct.yy_buffer_state* %144, i32 0, i32 1
  store i8* %143, i8** %145, align 8
  br label %149

; <label>:146                                     ; preds = %99
  %147 = load %struct.yy_buffer_state** %b, align 8
  %148 = getelementptr inbounds %struct.yy_buffer_state* %147, i32 0, i32 1
  store i8* null, i8** %148, align 8
  br label %149

; <label>:149                                     ; preds = %146, %135
  %150 = load %struct.yy_buffer_state** %b, align 8
  %151 = getelementptr inbounds %struct.yy_buffer_state* %150, i32 0, i32 1
  %152 = load i8** %151, align 8
  %153 = icmp ne i8* %152, null
  br i1 %153, label %155, label %154

; <label>:154                                     ; preds = %149
  call void @yy_fatal_error(i8* getelementptr inbounds ([44 x i8]* @.str918, i32 0, i32 0))
  br label %155

; <label>:155                                     ; preds = %154, %149
  %156 = load i32* %yy_c_buf_p_offset, align 4
  %157 = sext i32 %156 to i64
  %158 = load %struct.yy_buffer_state** %b, align 8
  %159 = getelementptr inbounds %struct.yy_buffer_state* %158, i32 0, i32 1
  %160 = load i8** %159, align 8
  %161 = getelementptr inbounds i8* %160, i64 %157
  store i8* %161, i8** @yy_c_buf_p, align 8
  %162 = load i64* @yy_buffer_stack_top, align 8
  %163 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %164 = getelementptr inbounds %struct.yy_buffer_state** %163, i64 %162
  %165 = load %struct.yy_buffer_state** %164, align 8
  %166 = getelementptr inbounds %struct.yy_buffer_state* %165, i32 0, i32 3
  %167 = load i64* %166, align 8
  %168 = load i32* %number_to_move, align 4
  %169 = sext i32 %168 to i64
  %170 = sub i64 %167, %169
  %171 = sub i64 %170, 1
  %172 = trunc i64 %171 to i32
  store i32 %172, i32* %num_to_read, align 4
  br label %87

; <label>:173                                     ; preds = %87
  %174 = load i32* %num_to_read, align 4
  %175 = icmp sgt i32 %174, 8192
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %173
  store i32 8192, i32* %num_to_read, align 4
  br label %177

; <label>:177                                     ; preds = %176, %173
  %178 = load i64* @yy_buffer_stack_top, align 8
  %179 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %180 = getelementptr inbounds %struct.yy_buffer_state** %179, i64 %178
  %181 = load %struct.yy_buffer_state** %180, align 8
  %182 = getelementptr inbounds %struct.yy_buffer_state* %181, i32 0, i32 6
  %183 = load i32* %182, align 4
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %185, label %244

; <label>:185                                     ; preds = %177
  store i32 42, i32* %c, align 4
  store i64 0, i64* %n, align 8
  br label %186

; <label>:186                                     ; preds = %212, %185
  %187 = load i64* %n, align 8
  %188 = load i32* %num_to_read, align 4
  %189 = sext i32 %188 to i64
  %190 = icmp ult i64 %187, %189
  br i1 %190, label %191, label %215

; <label>:191                                     ; preds = %186
  %192 = load %struct._IO_FILE** @yyin, align 8
  %193 = call i32 @_IO_getc(%struct._IO_FILE* %192)
  store i32 %193, i32* %c, align 4
  %194 = icmp ne i32 %193, -1
  br i1 %194, label %195, label %215

; <label>:195                                     ; preds = %191
  %196 = load i32* %c, align 4
  %197 = icmp ne i32 %196, 10
  br i1 %197, label %198, label %215

; <label>:198                                     ; preds = %195
  %199 = load i32* %c, align 4
  %200 = trunc i32 %199 to i8
  %201 = load i64* %n, align 8
  %202 = load i32* %number_to_move, align 4
  %203 = sext i32 %202 to i64
  %204 = load i64* @yy_buffer_stack_top, align 8
  %205 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %206 = getelementptr inbounds %struct.yy_buffer_state** %205, i64 %204
  %207 = load %struct.yy_buffer_state** %206, align 8
  %208 = getelementptr inbounds %struct.yy_buffer_state* %207, i32 0, i32 1
  %209 = load i8** %208, align 8
  %210 = getelementptr inbounds i8* %209, i64 %203
  %211 = getelementptr inbounds i8* %210, i64 %201
  store i8 %200, i8* %211, align 1
  br label %212

; <label>:212                                     ; preds = %198
  %213 = load i64* %n, align 8
  %214 = add i64 %213, 1
  store i64 %214, i64* %n, align 8
  br label %186

; <label>:215                                     ; preds = %195, %191, %186
  %216 = load i32* %c, align 4
  %217 = icmp eq i32 %216, 10
  br i1 %217, label %218, label %233

; <label>:218                                     ; preds = %215
  %219 = load i32* %c, align 4
  %220 = trunc i32 %219 to i8
  %221 = load i64* %n, align 8
  %222 = add i64 %221, 1
  store i64 %222, i64* %n, align 8
  %223 = load i32* %number_to_move, align 4
  %224 = sext i32 %223 to i64
  %225 = load i64* @yy_buffer_stack_top, align 8
  %226 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %227 = getelementptr inbounds %struct.yy_buffer_state** %226, i64 %225
  %228 = load %struct.yy_buffer_state** %227, align 8
  %229 = getelementptr inbounds %struct.yy_buffer_state* %228, i32 0, i32 1
  %230 = load i8** %229, align 8
  %231 = getelementptr inbounds i8* %230, i64 %224
  %232 = getelementptr inbounds i8* %231, i64 %221
  store i8 %220, i8* %232, align 1
  br label %233

; <label>:233                                     ; preds = %218, %215
  %234 = load i32* %c, align 4
  %235 = icmp eq i32 %234, -1
  br i1 %235, label %236, label %241

; <label>:236                                     ; preds = %233
  %237 = load %struct._IO_FILE** @yyin, align 8
  %238 = call i32 @ferror(%struct._IO_FILE* %237) #2
  %239 = icmp ne i32 %238, 0
  br i1 %239, label %240, label %241

; <label>:240                                     ; preds = %236
  call void @yy_fatal_error(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0))
  br label %241

; <label>:241                                     ; preds = %240, %236, %233
  %242 = load i64* %n, align 8
  %243 = trunc i64 %242 to i32
  store i32 %243, i32* @yy_n_chars, align 4
  br label %277

; <label>:244                                     ; preds = %177
  %245 = call i32* @__errno_location() #8
  store i32 0, i32* %245, align 4
  br label %246

; <label>:246                                     ; preds = %273, %244
  %247 = load i32* %number_to_move, align 4
  %248 = sext i32 %247 to i64
  %249 = load i64* @yy_buffer_stack_top, align 8
  %250 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %251 = getelementptr inbounds %struct.yy_buffer_state** %250, i64 %249
  %252 = load %struct.yy_buffer_state** %251, align 8
  %253 = getelementptr inbounds %struct.yy_buffer_state* %252, i32 0, i32 1
  %254 = load i8** %253, align 8
  %255 = getelementptr inbounds i8* %254, i64 %248
  %256 = load i32* %num_to_read, align 4
  %257 = sext i32 %256 to i64
  %258 = load %struct._IO_FILE** @yyin, align 8
  %259 = call i64 @fread(i8* %255, i64 1, i64 %257, %struct._IO_FILE* %258)
  %260 = trunc i64 %259 to i32
  store i32 %260, i32* @yy_n_chars, align 4
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %262, label %266

; <label>:262                                     ; preds = %246
  %263 = load %struct._IO_FILE** @yyin, align 8
  %264 = call i32 @ferror(%struct._IO_FILE* %263) #2
  %265 = icmp ne i32 %264, 0
  br label %266

; <label>:266                                     ; preds = %262, %246
  %267 = phi i1 [ false, %246 ], [ %265, %262 ]
  br i1 %267, label %268, label %276

; <label>:268                                     ; preds = %266
  %269 = call i32* @__errno_location() #8
  %270 = load i32* %269, align 4
  %271 = icmp ne i32 %270, 4
  br i1 %271, label %272, label %273

; <label>:272                                     ; preds = %268
  call void @yy_fatal_error(i8* getelementptr inbounds ([29 x i8]* @.str10, i32 0, i32 0))
  br label %276

; <label>:273                                     ; preds = %268
  %274 = call i32* @__errno_location() #8
  store i32 0, i32* %274, align 4
  %275 = load %struct._IO_FILE** @yyin, align 8
  call void @clearerr(%struct._IO_FILE* %275) #2
  br label %246

; <label>:276                                     ; preds = %272, %266
  br label %277

; <label>:277                                     ; preds = %276, %241
  %278 = load i32* @yy_n_chars, align 4
  %279 = load i64* @yy_buffer_stack_top, align 8
  %280 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %281 = getelementptr inbounds %struct.yy_buffer_state** %280, i64 %279
  %282 = load %struct.yy_buffer_state** %281, align 8
  %283 = getelementptr inbounds %struct.yy_buffer_state* %282, i32 0, i32 4
  store i32 %278, i32* %283, align 4
  br label %284

; <label>:284                                     ; preds = %277, %69
  %285 = load i32* @yy_n_chars, align 4
  %286 = icmp eq i32 %285, 0
  br i1 %286, label %287, label %299

; <label>:287                                     ; preds = %284
  %288 = load i32* %number_to_move, align 4
  %289 = icmp eq i32 %288, 0
  br i1 %289, label %290, label %292

; <label>:290                                     ; preds = %287
  store i32 1, i32* %ret_val, align 4
  %291 = load %struct._IO_FILE** @yyin, align 8
  call void @yyrestart(%struct._IO_FILE* %291)
  br label %298

; <label>:292                                     ; preds = %287
  store i32 2, i32* %ret_val, align 4
  %293 = load i64* @yy_buffer_stack_top, align 8
  %294 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %295 = getelementptr inbounds %struct.yy_buffer_state** %294, i64 %293
  %296 = load %struct.yy_buffer_state** %295, align 8
  %297 = getelementptr inbounds %struct.yy_buffer_state* %296, i32 0, i32 11
  store i32 2, i32* %297, align 4
  br label %298

; <label>:298                                     ; preds = %292, %290
  br label %300

; <label>:299                                     ; preds = %284
  store i32 0, i32* %ret_val, align 4
  br label %300

; <label>:300                                     ; preds = %299, %298
  %301 = load i32* @yy_n_chars, align 4
  %302 = load i32* %number_to_move, align 4
  %303 = add nsw i32 %301, %302
  %304 = sext i32 %303 to i64
  %305 = load i64* @yy_buffer_stack_top, align 8
  %306 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %307 = getelementptr inbounds %struct.yy_buffer_state** %306, i64 %305
  %308 = load %struct.yy_buffer_state** %307, align 8
  %309 = getelementptr inbounds %struct.yy_buffer_state* %308, i32 0, i32 3
  %310 = load i64* %309, align 8
  %311 = icmp ugt i64 %304, %310
  br i1 %311, label %312, label %342

; <label>:312                                     ; preds = %300
  %313 = load i32* @yy_n_chars, align 4
  %314 = load i32* %number_to_move, align 4
  %315 = add nsw i32 %313, %314
  %316 = load i32* @yy_n_chars, align 4
  %317 = ashr i32 %316, 1
  %318 = add nsw i32 %315, %317
  %319 = sext i32 %318 to i64
  store i64 %319, i64* %new_size1, align 8
  %320 = load i64* @yy_buffer_stack_top, align 8
  %321 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %322 = getelementptr inbounds %struct.yy_buffer_state** %321, i64 %320
  %323 = load %struct.yy_buffer_state** %322, align 8
  %324 = getelementptr inbounds %struct.yy_buffer_state* %323, i32 0, i32 1
  %325 = load i8** %324, align 8
  %326 = load i64* %new_size1, align 8
  %327 = call i8* @yyrealloc(i8* %325, i64 %326)
  %328 = load i64* @yy_buffer_stack_top, align 8
  %329 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %330 = getelementptr inbounds %struct.yy_buffer_state** %329, i64 %328
  %331 = load %struct.yy_buffer_state** %330, align 8
  %332 = getelementptr inbounds %struct.yy_buffer_state* %331, i32 0, i32 1
  store i8* %327, i8** %332, align 8
  %333 = load i64* @yy_buffer_stack_top, align 8
  %334 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %335 = getelementptr inbounds %struct.yy_buffer_state** %334, i64 %333
  %336 = load %struct.yy_buffer_state** %335, align 8
  %337 = getelementptr inbounds %struct.yy_buffer_state* %336, i32 0, i32 1
  %338 = load i8** %337, align 8
  %339 = icmp ne i8* %338, null
  br i1 %339, label %341, label %340

; <label>:340                                     ; preds = %312
  call void @yy_fatal_error(i8* getelementptr inbounds ([46 x i8]* @.str11, i32 0, i32 0))
  br label %341

; <label>:341                                     ; preds = %340, %312
  br label %342

; <label>:342                                     ; preds = %341, %300
  %343 = load i32* %number_to_move, align 4
  %344 = load i32* @yy_n_chars, align 4
  %345 = add nsw i32 %344, %343
  store i32 %345, i32* @yy_n_chars, align 4
  %346 = load i32* @yy_n_chars, align 4
  %347 = sext i32 %346 to i64
  %348 = load i64* @yy_buffer_stack_top, align 8
  %349 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %350 = getelementptr inbounds %struct.yy_buffer_state** %349, i64 %348
  %351 = load %struct.yy_buffer_state** %350, align 8
  %352 = getelementptr inbounds %struct.yy_buffer_state* %351, i32 0, i32 1
  %353 = load i8** %352, align 8
  %354 = getelementptr inbounds i8* %353, i64 %347
  store i8 0, i8* %354, align 1
  %355 = load i32* @yy_n_chars, align 4
  %356 = add nsw i32 %355, 1
  %357 = sext i32 %356 to i64
  %358 = load i64* @yy_buffer_stack_top, align 8
  %359 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %360 = getelementptr inbounds %struct.yy_buffer_state** %359, i64 %358
  %361 = load %struct.yy_buffer_state** %360, align 8
  %362 = getelementptr inbounds %struct.yy_buffer_state* %361, i32 0, i32 1
  %363 = load i8** %362, align 8
  %364 = getelementptr inbounds i8* %363, i64 %357
  store i8 0, i8* %364, align 1
  %365 = load i64* @yy_buffer_stack_top, align 8
  %366 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %367 = getelementptr inbounds %struct.yy_buffer_state** %366, i64 %365
  %368 = load %struct.yy_buffer_state** %367, align 8
  %369 = getelementptr inbounds %struct.yy_buffer_state* %368, i32 0, i32 1
  %370 = load i8** %369, align 8
  %371 = getelementptr inbounds i8* %370, i64 0
  store i8* %371, i8** @yytext, align 8
  %372 = load i32* %ret_val, align 4
  store i32 %372, i32* %1
  br label %373

; <label>:373                                     ; preds = %342, %39, %38
  %374 = load i32* %1
  ret i32 %374
}

; Function Attrs: nounwind uwtable
define internal void @yy_fatal_error(i8* %msg) #0 {
  %1 = alloca i8*, align 8
  store i8* %msg, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = load i8** %1, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([4 x i8]* @.str615, i32 0, i32 0), i8* %3)
  call void @exit(i32 2) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @yy_init_buffer(%struct.yy_buffer_state* %b, %struct._IO_FILE* %file) #0 {
  %1 = alloca %struct.yy_buffer_state*, align 8
  %2 = alloca %struct._IO_FILE*, align 8
  %oerrno = alloca i32, align 4
  store %struct.yy_buffer_state* %b, %struct.yy_buffer_state** %1, align 8
  store %struct._IO_FILE* %file, %struct._IO_FILE** %2, align 8
  %3 = call i32* @__errno_location() #8
  %4 = load i32* %3, align 4
  store i32 %4, i32* %oerrno, align 4
  %5 = load %struct.yy_buffer_state** %1, align 8
  call void @yy_flush_buffer(%struct.yy_buffer_state* %5)
  %6 = load %struct._IO_FILE** %2, align 8
  %7 = load %struct.yy_buffer_state** %1, align 8
  %8 = getelementptr inbounds %struct.yy_buffer_state* %7, i32 0, i32 0
  store %struct._IO_FILE* %6, %struct._IO_FILE** %8, align 8
  %9 = load %struct.yy_buffer_state** %1, align 8
  %10 = getelementptr inbounds %struct.yy_buffer_state* %9, i32 0, i32 10
  store i32 1, i32* %10, align 4
  %11 = load %struct.yy_buffer_state** %1, align 8
  %12 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %13 = icmp ne %struct.yy_buffer_state** %12, null
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %0
  %15 = load i64* @yy_buffer_stack_top, align 8
  %16 = load %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  %17 = getelementptr inbounds %struct.yy_buffer_state** %16, i64 %15
  %18 = load %struct.yy_buffer_state** %17, align 8
  br label %20

; <label>:19                                      ; preds = %0
  br label %20

; <label>:20                                      ; preds = %19, %14
  %21 = phi %struct.yy_buffer_state* [ %18, %14 ], [ null, %19 ]
  %22 = icmp ne %struct.yy_buffer_state* %11, %21
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %20
  %24 = load %struct.yy_buffer_state** %1, align 8
  %25 = getelementptr inbounds %struct.yy_buffer_state* %24, i32 0, i32 8
  store i32 1, i32* %25, align 4
  %26 = load %struct.yy_buffer_state** %1, align 8
  %27 = getelementptr inbounds %struct.yy_buffer_state* %26, i32 0, i32 9
  store i32 0, i32* %27, align 4
  br label %28

; <label>:28                                      ; preds = %23, %20
  %29 = load %struct._IO_FILE** %2, align 8
  %30 = icmp ne %struct._IO_FILE* %29, null
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %28
  %32 = load %struct._IO_FILE** %2, align 8
  %33 = call i32 @fileno(%struct._IO_FILE* %32) #2
  %34 = call i32 @isatty(i32 %33) #2
  %35 = icmp sgt i32 %34, 0
  %36 = zext i1 %35 to i32
  br label %38

; <label>:37                                      ; preds = %28
  br label %38

; <label>:38                                      ; preds = %37, %31
  %39 = phi i32 [ %36, %31 ], [ 0, %37 ]
  %40 = load %struct.yy_buffer_state** %1, align 8
  %41 = getelementptr inbounds %struct.yy_buffer_state* %40, i32 0, i32 6
  store i32 %39, i32* %41, align 4
  %42 = load i32* %oerrno, align 4
  %43 = call i32* @__errno_location() #8
  store i32 %42, i32* %43, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @yy_init_globals() #0 {
  store %struct.yy_buffer_state** null, %struct.yy_buffer_state*** @yy_buffer_stack, align 8
  store i64 0, i64* @yy_buffer_stack_top, align 8
  store i64 0, i64* @yy_buffer_stack_max, align 8
  store i8* null, i8** @yy_c_buf_p, align 8
  store i32 0, i32* @yy_init, align 4
  store i32 0, i32* @yy_start, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** @yyin, align 8
  store %struct._IO_FILE* null, %struct._IO_FILE** @yyout, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }
attributes #8 = { nounwind readnone }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
