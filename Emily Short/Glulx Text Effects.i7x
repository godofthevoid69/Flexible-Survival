Version 3 of Glulx Text Effects (for Glulx only) by Emily Short begins here.

"Glulx Text Effects provides an easy way to set up special text effects for Glulx."

Glulx color value is a kind of value. Some glulx color values are defined by the Table of Common Color Values.

[Table of Common Color Values
glulx color value	assigned number
g-black	0
g-dark-grey	4473924
g-medium-grey	8947848
g-light-grey	14540253
g-white	16777215]
[New color mode for windows]


text-justification is a kind of value. The text-justifications are left-justified, left-right-justified, center-justified, and right-justified.

special-style is a kind of value. The special-styles are special-style-1 and special-style-2.

boldness is a kind of value. The boldnesses are light-weight, regular-weight, and bold-weight.

obliquity is a kind of value. The obliquities are no-obliquity and italic-obliquity.

fixity is a kind of value. The fixities are fixed-width-font and proportional-font.

Before starting the virtual machine:
	initialize user styles.

Table of User Styles
style name (a special-style)	justification (a text-justification)	obliquity (an obliquity)	indentation (a number)	first-line indentation (a number)	boldness (a boldness)	fixed width (a fixity)	relative size (a number)	glulx color (a glulx color value)
--	--	--	--	--	--	--	--	--

[
a special-style	a text-justification	an obliquity	a number	a number	a boldness	a fixity	a number	a glulx color value
]

To initialize user styles:
	repeat through the Table of User Styles
	begin;
		if there is a justification entry, apply justification of (justification entry) to (style name entry);
		if there is an obliquity entry, apply obliquity (obliquity entry) to (style name entry);
		if there is an indentation entry, apply (indentation entry) indentation to (style name entry);
		if there is a first-line indentation entry, apply (first-line indentation entry) first-line indentation to (style name entry);
		if there is a boldness entry, apply (boldness entry) boldness to (style name entry);
		if there is a fixed width entry, apply fixed-width-ness (fixed width entry) to (style name entry);
		if there is a relative size entry, apply (relative size entry) size-change to (style name entry);
		if there is a glulx color entry, apply (assigned number of glulx color entry) color to (style name entry);
	end repeat.

To apply (color change - a number) color to (chosen style - a special-style):
	(- SetColor({chosen style}, {color change}); -)

To apply (relative size change - a number) size-change to (chosen style - a special-style):
	(- SetSize({chosen style}, {relative size change}); -)

To apply (chosen boldness - a boldness) boldness to (chosen style - a special-style):
	(- BoldnessSet({chosen style}, {chosen boldness}); -)

To apply (indentation amount - a number) indentation to (chosen style - a special-style):
	(- Indent({chosen style}, {indentation amount}); -)

To apply (indentation amount - a number) first-line indentation to (chosen style - a special-style):
	(- ParaIndent({chosen style}, {indentation amount}); -)

To apply justification of (justify - a text-justification) to (chosen style - a special-style):
	(- Justification({justify}, {chosen style}); -)

To apply fixed-width-ness (chosen fixity - a fixity) to (chosen style - a special-style):
	(- FixitySet({chosen style}, {chosen fixity}); -)

To apply obliquity (chosen obliquity - an obliquity) to (chosen style - a special-style):
	(- Obliquify({chosen style}, {chosen obliquity}); -)

Include (-

[ SetColor S N;
	S=S+8;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_TextColor, N);
];

[ FixitySet S N;
	S=S+8;
	N--;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Proportional, N);
];

[ SetSize S N;
	S=S+8;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Size, N);
];

[ BoldnessSet S N;
	S=S+8;
	N = N-2;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Weight, N);
];

[ ParaIndent S N;
	S=S+8;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_ParaIndentation, N);
];

[ Indent S N;
	S=S+8;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Indentation, N);
];

[ Justification N S;
	N--; S=S+8;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Justification, N);
];

[ Obliquify S N;
	S=S+8;
	N--;
	glk_stylehint_set(wintype_TextBuffer, S, stylehint_Oblique, N);
];

-)


To say first custom style:
	(- glk_set_style(style_User1); -)

To say second custom style:
	(- glk_set_style(style_User2); -)


Glulx Text Effects ends here.

---- Documentation ----

Glulx Text Effects provides an easy way to set up special text effects for Glulx.

Unlike the z-machine, which allows arbitrary combinations of features (such as color and boldness) to be applied to text, Glulx requires the author to define and then use text styles.

A text style in Glulx can have the following features:

	indentation: the number of units of indentation for the whole block of text, where units are defined by interpreter, but are often equivalent to spaces
	first-line indentation: relative indentation of the first line of the text block
	justification: can be left-justified, right-justified, justified on both the left and the right, or centered
	obliqueness: whether the font is italic or not
	weight: may be light, regular, or bold
	relative size: increase (or decrease) from the regular font size being used

A number of styles are predefined by Glulx. The author is also allowed to define two text styles of his own, which we will call special-style-1 and special-style-2.

To set up style instructions with Glulx Text Effects, we create a table, like this:

	Table of User Styles (continued)
	style name	justification	obliquity	indentation	first-line indentation	boldness	fixed width	relative size	glulx color
	special-style-1	center-justified	no-obliquity	0	0	regular-weight	proportional-font	0	g-black
	special-style-2	right-justified	italic-obliquity	0	4	regular-weight	proportional-font	0	g-black

Note that we *may* have multiple lines in this table referring to the same style. In that case, the last such line is the one that will take effect. This means that if the author is using an extension that includes a table of user styles, he may further continue the table in order to edit the styles defined by that extension.

The names of the style names (special-style-1 and special-style-2) may not be changed. However, we may set the justification to any of these:

	left-justified
	right-justified
	left-right-justified
	center-justified

We may set the obliquity to

	no-obliquity
	italic-obliquity

We may set the indentation and first-line indentation to numbers.

We may set the boldness to

	light-weight
	regular-weight
	bold-weight

We may set fixed width to

	proportional-font
	fixed-width-font

We set relative size to a number. This indicates by how many points the font size should be changed from the baseline size: a positive number if this text style should be larger than normal, a negative one if smaller.

Color is the most complicated thing to affect: color can be set to any value of the kind "glulx color value". This extension provides a table of glulx color values to start from, as follows:

	Table of Common Color Values
	glulx color value	assigned number
	g-black	0		[== $000000]
	g-dark-grey	4473924	[== $444444]
	g-medium-grey	8947848	[== $888888]
	g-light-grey	14540253	[== $DDDDDD]
	g-white	16777215		[== $FFFFFF]

where the assigned number of each value is the decimal representation of a hex color code. It is likely that we'll want to use other colors besides those provided by this extension. We may do this by continuing the table thus:

	Table of Common Color Values (continued)
	glulx color value	assigned number
	g-yellow-orange	39423		[== $0099FF]
	g-ice-blue	15645627		[== $EEBBBB]

These numbers are conversions of hex color numbers. The principle is that the hex number represents the amount of red in the first two digits (from 00 to FF); the amount of green in the next two digits; and the amount of blue in the last two digits. Thus $0000FF has no red or green in it, but the maximum possible amount of red. Where each pair of digits is equal (as in $444444 or $A0A0A0), we will have equal components of each color and the result will be some shade of grey. The number for g-ice-blue was selected by formulating a hex color number with a large amount of blue and a moderate amount of red and green ($EEBBBB). Similarly, the number for g-yellow-orange is the conversion of ($0099FF), with the maximum amount of red, a fair amount of green, and no blue.

Converting a hex number to a decimal one can be performed with a scientific calculator or with a hexadecimal conversion application found online; if we're at a loss, googling "hexadecimal conversion calculator" will likely turn up an appropriate application.

For reference, other common colors one might want to add might include

	Table of Common Color Values (continued)
	glulx color value	assigned number
	g-pure-blue	255		[== $0000FF]
	g-pure-green	65280		[== $00FF00]
	g-pure-cyan	65535		[== $00FFFF]
	g-pure-yellow	16776960		[== $FFFF00]
	g-pure-magenta	16711935		[== $FF00FF]
	g-pure-red	16711680		[== $FF0000]
	g-dark-red	11141120		[== $AA0000]

Once we have defined custom text styles, we may invoke them ourselves with

	say first custom style
	say second custom style

Example: * The Gallic War - An excuse to print a large, fancily-formatted bit of text

	"The Gallic War" by Julius Caesar.

	The story headline is "An interactive campaign".

	Lessons is a room.

	Include Glulx Text Effects by Emily Short. Include Basic Screen Effects by Emily Short.

	Table of User Styles (continued)
	style name	justification	obliquity	indentation	first-line indentation	boldness	fixed width	relative size	glulx color
	special-style-2	left-right-justified	italic-obliquity	15	-4	light-weight	proportional-font	0	g-medium-grey

	When play begins:
		change left hand status line to ""; change right hand status line to "";
		say "[second custom style]Gallia est omnis divisa in partes tres, quarum unam incolunt Belgae, aliam Aquitani, tertiam qui ipsorum lingua Celtae, nostra Galli appellantur. Hi omnes lingua, institutis, legibus inter se differunt. Gallos ab Aquitanis Garumna flumen, a Belgis Matrona et Sequana dividit.

Horum omnium fortissimi sunt Belgae, propterea quod a cultu atque humanitate provinciae longissime absunt, minimeque ad eos mercatores saepe commeant atque ea quae ad effeminandos animos pertinent important, proximique sunt Germanis, qui trans Rhenum incolunt, quibuscum continenter bellum gerunt. Qua de causa Helvetii quoque reliquos Gallos virtute praecedunt, quod fere cotidianis proeliis cum Germanis contendunt, cum aut suis finibus eos prohibent aut ipsi in eorum finibus bellum gerunt.";
		pause the game;
		say roman type;
		change left hand status line to "[location]"; change right hand status line to "[turn count]".

	Bank of the Garumna is a room.
