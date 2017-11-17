
vec_abs<-c("ROMEO: He jests at scars that never felt a wound. But,soft! what light through yonder window breaks? It is the east???and Juliet is the sun???Arise, fair sun, and kill the envious moon, Who is already sick and pale with grief, That thou her maid art far more fair than she: Be not her maid, since she is envious???Her vestal livery is but sick and green And none but fools do wear it; castit off. It is my lady, O, it is my love! O, that she knew she were! She speaks yet she says nothing: what of that? Her eye discourses, I will answer it???I am too bold, 'tis not to me she speaks: Two of the fairest stars in all the heaven, Having some business, do entreat her eyes To twinklein their spheres till they return. What if her eyes were there, they in her head? The brightness of her cheek would shame those stars, As daylight doth a lamp; her eyes in heavenWould through the airy region stream so bright That birds would sing and think it were not night. See, how she leans her cheek upon her hand! O, that I were a glove upon that hand, That I might touch that cheek!" ,
           
           "JULIET: Ay me! ",
           
           "ROMEO: She speaks: O, speak again, bright angel!for thou art As glorious to this night, being o'er my head As is a winged messenger of heaven Unto the white-upturned wondering eyes Of mortals that fall back to gazeon himWhen he bestrides the lazy-pacing clouds And sails upon the bosomof the air. ",
           
           "JULIET: O Romeo, Romeo! whereforeart thou Romeo? Deny thy father and refuse thy name; Or, if thou wilt not???be but sworn my love, And I'll no longer be a Capulet.",
           
           "ROMEO: Shall I hear more???or shall I speak at this?",
           
           "JULIET:  'Tisbut thy name that is my enemy; Thou art thyself???though not a Montague. What's Montague? it is nor hand, nor foot, Nor arm, nor face, nor any other part Belonging to a man. O, be some other name! What's in a name? that which we call a roseBy any other name would smell as sweet; So Romeo would, were he not Romeo call'd, Retain that dear perfection which he owes Without that title. Romeo, doffthy name, And for that name which is no part of thee Take all myself.",
           
           "ROMEO: I take thee at thy word: Call me but love, and I'll be new baptized, HenceforthI never will be Romeo. ",
           
           "JULIET: What man art thou that thus bescreen'din night So stumblest on my counsel? ",
           
           "ROMEO: By a nameI know not haw to tell thee who I am???My name, dear saint, is hateful to myself, Because it is an enemy to thee, Had I it written,I would tear the word. ",
           
           "JULIET: My ears have not yet drunk a hundred words Of that tongue's utterance, yet I know the sound:Art thou not Romeo and a Montague? ",
           
           "ROMEO: Neither???fair saint, if either thee dislike. ",
           
           "JULIET: How camest thou hither???tell me???and wherefore? The orchard walls are high and hard to climb, And the place death, considering who thou art, If any of my kinsmen find thee here."
)           


library(NLP)
library(tm)
library(SnowballC)

abs      = Corpus(VectorSource(vec_abs))
abs_dtm  = DocumentTermMatrix(abs, control = list(
  stemming = TRUE, stopwords = TRUE, minWordLength = 3,
  removeNumbers = TRUE, removePunctuation = TRUE))

dim(abs_dtm)
inspect(abs_dtm)
findFreqTerms(abs_dtm, 3)
removeSparseTerms(abs_dtm, 0.5)
inspect(removeSparseTerms(abs_dtm, 0.5))



library(ggplot2) 
library(RColorBrewer)
library(wordcloud)

freq = colSums(as.matrix(abs_dtm))   
wf   = data.frame(word=names(freq), freq=freq)   


#HW5.2
plot = ggplot(subset(wf, freq>1), aes(word, freq))    
plot = plot + geom_bar(stat="identity")   
plot = plot + theme(axis.text.x=element_text(angle=45, hjust=1))   
plot  

#HW5.1   
dark2 = brewer.pal(6, "Dark2")   
wordcloud(names(freq), freq, max.words=100, rot.per=0.2, colors=dark2) 
