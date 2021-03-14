
#################################################################
#                    PART 06) ºñÁ¤Çü µ¥ÀÌÅÍ¸¶ÀÌ´×             
#################################################################



##===============================================================
### 1. ÅØ½ºÆ®¸¶ÀÌ´× : ÅØ½ºÆ®·ÎºÎÅÍ °íÇ°ÁúÀÇ Á¤º¸¸¦ µµÃâÇÏ´Â ºĞ¼®¹æ¹ıÀ¸·Î, ÀÔ·ÂµÈ ÅØ½ºÆ®¸¦ ±¸Á¶È­ÇØ ±× µ¥ÀÌÅÍ¿¡¼­
###                   ÆĞÅÏÀ» µµÃâÇÑ ÈÄ °á°ú¸¦ Æò°¡ ¹× ÇØ¼®ÇÏ´Â ÀÏ·ÃÀÇ °úÁ¤.
###                   ´Ü¾îµé °£ÀÇ °ü°è¸¦ ÀÌ¿ëÇØ °¨¼ººĞ¼®, ¿öµåÅ¬¶ó¿ìµå ºĞ¼® µîÀ» ¼öÇàÇÑ ÈÄ ÀÌ Á¤º¸¸¦ Å¬·¯½ºÅÍ¸µ, 
###                   ºĞ·ù, »çÈ¸¿¬°á¸Á ºĞ¼® µî¿¡ È°¿ëÇÒ ¼ö ÀÖÀ½.

### ÇØ´ç °úÁ¤¿¡¼­´Â ADP ½Ç±â¿¡ ÃâÁ¦µÇ´Â ÇÑ±Û¿¡ ´ëÇÑ ÅØ½ºÆ® ¸¶ÀÌ´× ºĞ¼® ¹æ¹ıÀ» ¼³¸íÇÔ.

## °¡. µ¥ÀÌÅÍ ÀüÃ³¸® : ¼öÁıµÈ µ¥ÀÌÅÍ¿¡ ¹®Àå ºÎÈ£³ª ÀÇ¹Ì ¾ø´Â ¼ıÀÚ¿Í ´Ü¾î, URLµî°ú °°ÀÌ ºĞ¼®À» ÇÏ´Âµ¥ ÀÖ¾î
##                     À¯ÀÇÇÏ°Ô »ç¿ëµÇÁö ¾Ê´Â ºÎºĞÀ» Á¦°ÅÇÏ°Å³ª º¯ÇüÇÏ¿© ºĞ¼®¿¡ ¿ëÀÌÇÏ°Ô ÅØ½ºÆ®¸¦ °¡°øÇÏ´Â °úÁ¤.

# 1) tm : tm ÆĞÅ°Áö´Â ¹®¼­¸¦ °ü¸®ÇÏ´Â ±âº»±¸Á¶ÀÎ Corpus¸¦ »ı¼ºÇÏ¿© tm_map ÇÔ¼ö¸¦ ÅëÇØ µ¥ÀÌÅÍµéÀ» ÀüÃ³¸® ¹× °¡°øÇÔ.
#         Corpus¿Í VCorpus Áß VCorpus¿¡¼­ ¿¡·¯°¡ Àû°Ô ³ªÅ¸³ª¹Ç·Î VCorpus¸¦ È°¿ë

#VectorSource(text)   #ÅØ½ºÆ® ¸¶ÀÌ´× Àü ÅØ½ºÆ® µ¥ÀÌÅÍ¸¦ ¹®¼­·Î ¸¸µé±â À§ÇÑ ÇÔ¼ö.

#VCoupus(data)         #data´Â vectorSourceÇÔ¼ö¸¦ ½ÇÇàÇÑ µ¥ÀÌÅÍ°¡ µé¾î°¡¾ßÇÔ.

#ex) ¾Æ·¡ÀÇ R ³»Àåµ¥ÀÌÅÍ·Î ÄÚÆÛ½º¸¦ »ìÆìº¸ÀÚ.

library(tm)

data(crude)       #crudeµ¥ÀÌÅÍ´Â ·ÎÀÌÅÍ ´º½º ±â»ç Áß ¿øÀ¯¿Í °ü·ÃµÈ ±â»ç 20°³°¡ ÀúÀåµÇ¾î ÀÖÀ½.

summary(crude)[1:6,]    #summary¸¦ ÅëÇØ 20°³ÀÇ ±â»ç°¡ ÀÖÀ½À» È®ÀÎÇÒ ¼ö ÀÖÀ½.
#class´Â TextDocument ÀÌ¸ç, list ÇüÅÂ·Î ÀúÀåµÇ¾î ÀÖÀ½

inspect(crude[1])   #inspectÇÔ¼ö·Î ¹®¼­ÀÇ character¼ö µîÀ» È®ÀÎÇÒ ¼ö ÀÖÀ½.

crude[[1]]$content  #Ã¹¹øÂ° ¹®¼­ÀÇ º»¹®Àº ¿ŞÂÊ ¸í·É¾îÃ³·³ ÀÛ¼ºÇÏ¿© È®ÀÎÀÌ °¡´É(¸®½ºÆ® ÀÌ¹Ç·Î)


#tm_map(x,            #x´Â ÄÚÆÛ½º µ¥ÀÌÅÍ
#       FUN)          #FUNÀº º¯È¯¿¡ »ç¿ëÇÒ ÇÔ¼ö, Á¾·ù´Â ¾Æ·¡¿Í °°À½

#tm_map(x,tolower) : ¼Ò¹®ÀÚ·Î ¸¸µé±â
#tm_map(x,stemDocument) : ¾î±Ù¸¸ ³²±â±â
#tm_map(x,stripWhitespace) : °ø¹éÁ¦°Å
#tm_map(x,removePunctuation) : ¹®ÀåºÎÈ£ Á¦°Å
#tm_map(x,removeNumbers) : ¼ıÀÚ Á¦°Å
#tm_map(x,removeWords,¡°word¡±) : ´Ü¾î Á¦°Å
#tm_map(x,remobeWords,stopwords(¡°english¡±)) : ºÒ¿ë¾î Á¦°Å
#tm_map(x,PlainTextDocument) : TextDocument·Î º¯È¯ 


#ex) µ¥ÀÌÅÍ ºĞ¼® Àü¹®°¡¶ó´Â Å°¿öµå·Î ´º½º±â»ç¸¦ °Ë»öÇÏ¿© 10°³ÀÇ ±â»ç¸¦ ¼öÁıÇÏ¿´´Ù.
#    ¾Æ·¡ÀÇ µ¥ÀÌÅÍ¸¦ Corpus·Î ¸¸µé°í, tm_mapÇÔ¼ö·Î µ¥ÀÌÅÍ¸¦ ÀüÃ³¸®ÇØº¸ÀÚ.

news<-readLines("Å°¿öµå_´º½º.txt")

news

news.corpus<-VCorpus(VectorSource(news))

news.corpus[[1]]$content

clean_txt<-function(txt){
  txt<-tm_map(txt, removeNumbers)       #¼ıÀÚÁ¦°Å       
  txt<-tm_map(txt, removePunctuation)   #¹®ÀåºÎÈ£ Á¦°Å
  txt<-tm_map(txt, stripWhitespace)     #°ø¹éÁ¦°Å
  return(txt)
}

clean.news<-clean_txt(news.corpus)

clean.news[[1]]$content


txt2<-gsub("[[:punct:]]","",clean.news[[1]])   #gsub ÇÔ¼ö´Â ¿¢¼¿ µî¿¡¼­ÀÇ Ã£¾Æ¹Ù²Ù±âÀÇ ±â´ÉÀ» ÇÔ.
txt2


# 2) ÀÚ¿¬¾îÃ³¸®(KoNLP) : KoNLP°¡ ´ëÇ¥ÀûÀÌ¸ç, KoNLP »ç¿ë ½Ã rJavaÆĞÅ°Áö¸¦ ¼³Ä¡ÇØ¾ß ÇÔ.
#                        ÀÚ¿¬¾î Ã³¸®¿¡ ¾Õ¼­ reference¸¦ »ïÀ» »çÀüÀ» ¼³Á¤. ÁÖ·Î SejongDic »ç¿ë
#                        extraNoun, mergeUserDic, SimplePos09 µîÀÇ ÇÔ¼ö·Î ÀÚ¿¬¾î Ã³¸®°¡ °¡´É

#extraNoun(text)                    #ÅØ½ºÆ® Áß ¸í»ç¸¦ ÃßÃâÇÏ´Â ÇÔ¼ö.
#buildDictionary(ext_dic,           #»çÀü¿¡ ´Ü¾î¸¦ Ãß°¡À¸·Î Ãß°¡ÇÒ »çÀüÀ» ¼±ÅÃ, "woorimalsam", "sejong" µîÀÌ ÀÖÀ½.
#                data)              #data´Â Ãß°¡ÇÏ°íÀÚÇÏ´Â ´Ü¾î¿Í Ç°»ç.
#SimplePos22(txt)                   #22°³ÀÇ Ç°»ç ÅÂ±×¸¦ ´Ş¾ÆÁÖ´Â ÇÔ¼ö.

#ex) °£´ÜÇÑ ¹®ÀåÀ¸·Î ¸í»çÃßÃâ, »çÀü ´Ü¾îÃß°¡, Ç°»ç¸¦ È®ÀÎÇØº¸ÀÚ.

library(KoNLP)

useSejongDic()         #¼¼Á¾»çÀü »ç¿ë

sentence<-'¾Æ¹öÁö°¡ ¹æ¿¡ ½º¸£¸¤ µé¾î°¡½Å´Ù.'

extractNoun(sentence)  #'½º¸£¸¤'Àº ¸í»ç°¡ ¾Æ´Ï¶ó ºÎ»çÀÓ. '½º¸£¸¤'ÀÌ¶õ ´Ü¾î°¡ ¼¼Á¾»çÀü¿¡ Æ÷ÇÔµÇ¾î ÀÖÁö ¾ÊÀ¸¹Ç·Î
#'½º¸£¸¤'À» ºÎ»ç·Î ¼¼Á¾»çÀü¿¡ Ãß°¡

buildDictionary(ext_dic="sejong",                           #sejong »çÀü¿¡ ½º¸£¸¤À» ºÎ»ç·Î Ãß°¡.
                user_dic=data.frame(c('½º¸£¸¤'),c('mag')))

extractNoun(sentence)  #'½º¸£¸¤'ÀÌ ¸í»ç·Î ÃßÃâµÇÁö ¾ÊÀ½À» ¾Ë ¼ö ÀÖÀ½.

SimplePos22(sentence)  #Ç°»ç¸¦ È®ÀÎÇÒ ¼ö ÀÖÀ½. NCÀº ¸í»ç(NÀ¸·Î ½ÃÀÛÇÏ´Â°Ç ¸ğµÎ ¸í»ç)ÀÌ¸ç, 
#PV´Â µ¿»ç, PA´Â Çü¿ë»ç, MA´Â ºÎ»çÀÓ.



#ex) À§ÀÇ newsµ¥ÀÌÅÍ¿¡¼­ corpus·Î º¯È¯ÇÏÁö ¾Ê°í ÀüÃ³¸® ¹× ¸í»çÃßÃâ, »çÀüÃß°¡, Ç°»çÈ®ÀÎÀ» ÇØº¸ÀÚ.

# tmÆĞÅ°Áö¿¡¼­ tm_map()¿¡ µé¾î°¡´Â FUNÀ» ±×´ë·Î »ç¿ëÇÏ¿© ÀüÃ³¸®°¡ °¡´É

clean_txt2<-function(txt){
  txt<-removeNumbers(txt)          #¼ıÀÚ Á¦°Å
  txt<-removePunctuation(txt)      #¹®ÀåºÎÈ£ Á¦°Å
  txt<-stripWhitespace(txt)        #°ø¹éÁ¦°Å
  txt<-gsub("[^[:alnum:]]"," ",txt) #¿µ¼ıÀÚ, ¹®ÀÚ¸¦ Á¦¿ÜÇÑ °ÍµéÀ» " "À¸·Î Ã³¸®
  return(txt)
}

clean.news2<-clean_txt2(news)

Noun.news<-extractNoun(clean.news2)     #°¢ ¹®¼­¸¶´Ù ¸í»ç°¡ ÃßÃâ

Noun.news[5]

#clean.news2ÀÇ 5¹øÂ° ±â»ç¿¡¼­ 'ÇªµåÅ×Å©', '½ºÅ¸Æ®¾÷', 'ºòµ¥ÀÌÅÍ', '¿ì¾ÆÇÑÇüÁ¦µé' ¸í»ç·Î Ãß°¡ÇÏ¿© ¸í»çÃßÃâ

Noun.news[5]      #Çªµå¿Í Å×Å©, ½ºÅ¸Æ®¿Í ¾÷À» µû·Î ÀÎ½ÄÇÏ°í, ºòµ¥ÀÌÅÍ¸¦,ÀÌ ¿Í ¿ì¾ÆÇÑÇüÁ¦µé´ëÇ¥ µî ¸í»ç·Î ÀÎ½Ä ¸øÇÔ.

buildDictionary(ext_dic="sejong",                               
                user_dic=data.frame(c(read.table("food.txt"))))   #textÆÄÀÏ ÇüÅÂ·Î È£Ãâ °¡´É

extractNoun(clean.news2[5])         #½ºÅ¸Æ®¾÷, ºòµ¥ÀÌÅÍ, ÇªµåÅ×Å©, ¿ì¾ÆÇÑÇüÁ¦µéÀÌ ¸í»ç·Î ÃßÃâµÊÀ» È®ÀÎ

#SimplePos22¸¦ È°¿ëÇØ Çü¿ë»ç ÃßÃâÇÏ±â.(stringr ÆĞÅ°ÁöÀÇ str_matchÇÔ¼ö·Î Çü¿ë»ç »Ì¾Æ³»±â)
library(stringr)

doc1<-paste(SimplePos22(clean.news2[[2]]))    #SimplePos22¸¦ ÅëÇØ Ç°»ç¸¦ ±¸ºĞÇÏ°í, ºĞ¼®¿¡ ¿ëÀÌÇÏ°Ô ÇÏ±â À§ÇØ


doc2<-str_match(doc1,"([°¡-ÆR]+)/PA")         #Ç°»çÁß PA°¡ Çü¿ë»çÀÌ¹Ç·Î Çü¿ë»ç¸¸ »Ì¾Æ³»±â À§ÇØ str_matchÇÔ¼ö ÀÌ¿ë.

doc2

doc3<-doc2[,2]                                #°á°ú Áß Ç°»ç°¡ ¾ÈºÙ¾îÀÖ´Â 2¿­¸¸ »Ì¾Æ³¿
doc3[!is.na(doc3)]                            #NA°¡ ¾Æ´Ñ Çü¿ë»ç¸¸ »Ì¾Æ³»¾î ³ªÅ¸³¿.


# 3) Stemming : ¾î°£ÃßÃâÀº °øÅë ¾î°£À» °¡Áö´Â ´Ü¾î¸¦ ¹­´Â ÀÛ¾÷
#               stemDocument, stemCompletionÀ» È°¿ëÇÏ¿© ¿Ï¼º.

# stemDocument(text)               #¹®ÀÚ ¶Ç´Â ¹®¼­

# stemCompletion(text,             #stemmingÀÌ ¿Ï·áµÈ ¹®ÀÚ ¶Ç´Â ¹®¼­
#                dictionary,       #¾î°£ ÃßÃâÀÌ ÇÊ¿äÇÑ ´Ü¾î¸¦ »çÀü¿¡ Ãß°¡
#                ...)

#ex) analyze, analyzed, analyzing ´Ü¾îÀÇ ¾î°£À» ÃßÃâÇÏ°í °¡Àå ±âº»´Ü¾î·Î ¸¸µé¾î º¸ÀÚ.

test<-stemDocument(c('analyze', 'analyzed','analyzing'))
test                            # ¾Õ ¾î°£À» Á¦¿ÜÇÑ ³ª¸ÓÁö ºÎºĞÀº Àß·Á³ª°¡°Ô µÊ.

completion<-stemCompletion(test,dictionary = c('analyze', 'analyzed','analyzing'))
completion                      # analyz·Î stemmingµÇ¾ú´ø ´Ü¾îµéÀÌ dictionary¿¡ Æ÷ÇÔµÈ ´Ü¾î Áß °¡Àå ±âº» ¾îÈÖ·Î ¿Ï¼º



## ³ª. Term-Document Matrix : CorpusÀÇ µ¥ÀÌÅÍ¸¦ °¢ ¹®¼­¿Í ´Ü¾î °£ÀÇ »ç¿ë ¿©ºÎ¸¦ ÀÌ¿ëÇØ ¸¸µé¾îÁø matrix°¡ TDMÀÓ.
##                          : TDMÀ» º¸¸é µîÀåÇÑ °¢ ´Ü¾îÀÇ ºóµµ¼ö¸¦ ½±°Ô È®ÀÎÇÒ ¼ö ÀÖÀ½.

#TermDocumentMatrix(data,     
#                   control)   #»çÀüº¯°æ, °¡ÁßÄ¡ºÎ¿© µîÀÇ ¿É¼ÇÀ» È°¿ëÇÒ ¼ö ÀÖÀ½.

#ex) ÀüÃ³¸®°¡ ¿Ï·áµÈ clean.news2 µ¥ÀÌÅÍ¸¦ VCorpus·Î º¯È¯ÇÏ¿© TDMÀ» ¸¸µé¾îº¸ÀÚ.

VC.news<-VCorpus(VectorSource(clean.news2))

VC.news[[1]]$content

TDM.news<-TermDocumentMatrix(VC.news)
dim(TDM.news)              #10°³ÀÇ ±â»ç¿¡¼­ ÃÑ 1011°³ÀÇ ´Ü¾î°¡ ÃßÃâµÇ¾î 1011°³ÀÇ Çà°ú 10°³ÀÇ ¿­À» °¡Áö´Â ÇüÅÂ

inspect(TDM.news[1:5,])          #»ı¼ºµÈ TDM¿¡¼­ ÀüÃ¼ ¹®¼­¿Í ´Ü¾îÀÇ ºĞÆ÷¸¦ È®ÀÎ.
#¿©±â¼­ 'ºòµ¥ÀÌÅÍ'¶ó´Â ´Ü¾î°¡ 1¹ø¹®¼­¿¡´Â 1¹ø, 2¹ø¹®¼­¿¡´Â 3¹ø µîÀ¸·Î »ç¿ëµÆÀ½À» È®ÀÎ.

#¸í»ç¸¸ ÃßÃâÇÏ´Â TermDocumentMatrix¸¦ ¸¸µé±âÀ§ÇÑ »ç¿ëÀÚ Á¤ÀÇÇÔ¼ö »ı¼º
words<-function(doc){
  doc<-as.character(doc)
  extractNoun(doc)
}

TDM.news2<-TermDocumentMatrix(VC.news, control=list(tokenize=words))
dim(TDM.news2)             #10°³ÀÇ ±â»ç¿¡¼­ ÃÑ 289°³ÀÇ ´Ü¾î°¡ ÃßÃâµÇ¾î 289°³ÀÇ Çà°ú 10°³ÀÇ ¿­À» °¡Áö´Â ÇüÅÂ

inspect(TDM.news2)         #»ı¼ºµÈ TDM¿¡¼­ ÀüÃ¼ ¹®¼­¿Í ´Ü¾îÀÇ ºĞÆ÷¸¦ È®ÀÎ.

#TDMÀ¸·Î ³ªÅ¸³­ ´Ü¾îµéÀÇ ºóµµ Ã¼Å©
tdm2<-as.matrix(TDM.news2)
tdm3<-rowSums(tdm2)
tdm4<-tdm3[order(tdm3, decreasing = T)]
tdm4[1:10]      #1~10À§±îÁö¸¸ ³ªÅ¸³¿.


#ºĞ¼®¿¡ »ç¿ëÇÏ°íÀÚÇÏ´Â ´Ü¾îµéÀ» º°µµ »çÀüÀ¸·Î Á¤ÀÇÇØ ÇØ´ç ´Ü¾îµé¿¡ ´ëÇØ¼­¸¸ °á°ú¸¦ »êÃâ

mydict<-c("ºòµ¥ÀÌÅÍ", "½º¸¶Æ®", "»ê¾÷Çõ¸í", "ÀÎ°øÁö´É", "»ç¹°ÀÎÅÍ³İ", "AI", "½ºÅ¸Æ®¾÷", "¸Ó½Å·¯´×")

my.news<-TermDocumentMatrix(VC.news,control=list(tokenize=words, dictionary=mydict))

inspect(my.news)            #º°µµ »çÀüÀ¸·Î Á¤ÀÇµÈ ´Ü¾î¸¸ ¶°ÀÖÀ½À» È®ÀÎÇÒ ¼ö ÀÖÀ½.


## ´Ù. ºĞ¼® ¹× ½Ã°¢È­ 

# 1) ¿¬°ü±ÔÄ¢ºĞ¼® : ÀÛ¼ºµÈ TDM¿¡¼­ Æ¯Á¤ ´Ü¾î¿ÍÀÇ ¿¬°ü¼º¿¡ µû¶ó ´Ü¾î¸¦ Á¶È¸ÇÒ ¼ö ÀÖÀ½.

#findAssocs(data,        #TDM
#           terms,       #¿¬°ü¼ºÀ» È®ÀÎÇÒ ´Ü¾î
#           corlimit)    #ÃÖ¼Ò ¿¬°ü¼º

#ex) TDM¿¡¼­ 'ºĞ¼®'ÀÌ¶ó´Â ´Ü¾î¿ÍÀÇ ¿¬°ü¼ºÀÌ 0.3ÀÌ»óÀÎ ´Ü¾îµé¸¸ Ç¥½Ã

findAssocs(TDM.news2,'ºòµ¥ÀÌÅÍ',0.9)    #ºòµ¥ÀÌÅÍ¶õ ´Ü¾î¿Í ¹«½¼ ³»¿ëÀÌ ¿¬°üµÇ¾î ÇÔ²² ¾ğ±ŞµÇ´ÂÁö ¾Ë¼ö ÀÖÀ½.

# 2) ¿öµå Å¬¶ó¿ìµå : ¹®¼­¿¡ Æ÷ÇÔµÇ´Â ´Ü¾îÀÇ »ç¿ë ºóµµ¸¦ È¿°úÀûÀ¸·Î º¸¿©ÁÖ±â À§ÇØ ¿öµå Å¬¶ó¿ìµå¸¦ ÀÌ¿ë
#                    wordcloud ÆĞÅ°Áö¸¦ ÀÌ¿ë

#wordcloud(words,         #´Ü¾î
#          freq,          #´Ü¾îÀÇ ºóµµ
#          min.freq,      #ÃÖ¼Ò ºóµµ
#          random.order,  #´Ü¾î ¹èÄ¡¸¦ ¹°¾îº½. F¸é ºóµµ¼øÀ¸·Î ±×·ÁÁü.
#          colors,        #´Ü¾îÀÇ »ö, RÀÇ »ö»ó ÆÄ·¹Æ® ÇÔ¼öÀÎ brewer.palÀ» ÁÖ·Î »ç¿ë.
#          ...)

#ex) TDM.news2 µ¥ÀÌÅÍ¸¦ ¿öµåÅ¬¶ó¿ìµå·Î ¸¸µé¾îº¸ÀÚ.

install.packages("wordcloud")
library(wordcloud)

tdm2<-as.matrix(TDM.news2)
term.freq<-sort(rowSums(tdm2),decreasing = T)    #ÇàÀ» ±âÁØÀ¸·Î ¸ğµç ¿­ÀÇ °ªÀ» ÇÕÇÏ¿© °¢ ´Ü¾î¿¡ ´ëÇÑ ºóµµ¼ö °è»ê.
head(term.freq,15)

wordcloud(words=names(term.freq),        #term.freqÀÇ ÀÌ¸§¸¸ °¡Á®¿È.
          freq=term.freq,                #ºóµµ´Â À§¿¡ ÀúÀåÇÑ term.freq.
          min.freq=5,                    #ÃÖ¼Òºóµµ´Â 5
          random.order=F,
          colors=brewer.pal(8,'Dark2'))