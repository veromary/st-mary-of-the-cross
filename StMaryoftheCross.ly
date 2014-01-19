\version "2.12.2"

#(set-global-staff-size 23)

\paper {
        #(set-paper-size "a4")
	myStaffSize = #23
	#(define fonts
	 (make-pango-font-tree "Linux Libertine O"
	 		       "Liberation Sans"
			       "Liberation Mono"
			       (/ myStaffSize 23)))
	after-title-space = 10\mm
	before-title-space = 20\mm
	between-system-padding = 8\mm
}


\header {
        title = \markup "St Mary of the Cross"
	composer = "Speier Gesangbuch, 1599"
	poet = "Veronica Brandt"
%	instrument = "organ"
	tagline = \markup { \fill-line { 
	                       \line { VB 2011 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key c \major
    \time 4/4
}

sop = \transpose d c \relative c' {
      \autoBeamOff 
      \partial 4 d4 fis g a b a g fis \bar ""
      a d d cis e8[ d] cis4 b a \breathe
      d d a b b a g fis  \bar ""
      e fis a g fis g e d \bar "||"

}

alt = \transpose d c \relative c' {

      \partial 4 a4 d d d d cis e d
      e d e e fis a gis a
      a8[ g] fis4 d d g8[ fis] e4 cis d
      cis d fis e d8[ cis] b4 cis d

}

ten = \transpose d c \relative c {

      \partial 4 fis4 a g fis g8[ fis] e4 a a
      a fis gis a a8[ b] cis[ d] e[ d] cis4
      a4 a d8[ cis] b4 g a a a
      a4 a d8[ cis] b4 b8[ a] g4 a8[ g] fis4

}

bass = \transpose d c \relative c {

      \partial 4 d4 d b a g a cis d 
      cis b b a d e e a
      fis8[ e] d4 fis g e8[ d] cis4 a d
      a'8[ g] fis[ e] d4 e b e a, d

}

verseA = \lyricmode {
  \set stanza = #"1. "O Mo -- ther Ma -- ry of the Cross,
           the first Aus -- tra -- lian saint, we hail.
           Thy work to lead the poor to truth
	   A -- wak -- ing mer -- cy in thy trail.
	   }

verseB = \lyricmode {
  \set stanza = #"2. "
 To Jo -- seph's aid thou e -- ver turned,
 Strong in the faith that he would be
 An ad -- vo -- cate to that dear Heart
 That bled and died u -- pon the Tree.
}

verseC = \lyricmode {
  \set stanza = #"3. "
The Tree of life, the Cross of death
To which thy name and life were bound,
the pa -- ra -- dox that pain and strife
to e -- ver -- last -- ing joy re -- dound.
}

verseD = \lyricmode {
  \set stanza = #"4. "
O Ma -- ry! in -- ter -- cede for us
and form us to His ho -- ly Will
with Fa -- ther and the Ho -- ly Ghost
and Heart of Je -- sus burn -- ing still.
}


\score {
  \new ChoirStaff <<
  \new Staff = "RH"
     <<
     \new Voice = "sopranos" {
     \voiceOne
     << \global \sop >>
     }
     \\
     \global \alt
     >>
  \new Lyrics = sopranos \lyricsto sopranos \verseA
  \new Lyrics = sopranos \lyricsto sopranos \verseB
  \new Lyrics = sopranos \lyricsto sopranos \verseC
  \new Lyrics = sopranos \lyricsto sopranos \verseD
   \new Staff = "LH"
  <<
     \clef bass
     \global \ten
     \\
     \global \bass
  >>
>>
 \layout {
    \context {
      \Staff
    }
  }				      
 \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
}
}		       

