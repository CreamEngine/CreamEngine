/*
 * Copyright (c) 2020 Jeremy Meltingtallow
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package pongo.input;

@:enum abstract KeyCode(Int) to Int from kha.input.KeyCode {
	var Unknown = 0;
	var Back = 1; // Android
	var Cancel = 3;
	var Help = 6;
	var Backspace = 8;
	var Tab = 9;
	var Clear = 12;
	var Return = 13;
	var Shift = 16;
	var Control = 17;
	var Alt = 18;
	var Pause = 19;
	var CapsLock = 20;
	var Kana = 21;
	var Hangul = 21;
	var Eisu = 22;
	var Junja = 23;
	var Final = 24;
	var Hanja = 25;
	var Kanji = 25;
	var Escape = 27;
	var Convert = 28;
	var NonConvert = 29;
	var Accept = 30;
	var ModeChange = 31;
	var Space = 32;
	var PageUp = 33;
	var PageDown = 34;
	var End = 35;
	var Home = 36;
	var Left = 37;
	var Up = 38;
	var Right = 39;
	var Down = 40;
	var Select = 41;
	var Print = 42;
	var Execute = 43;
	var PrintScreen = 44;
	var Insert = 45;
	var Delete = 46;
	var Zero = 48;
	var One = 49;
	var Two = 50;
	var Three = 51;
	var Four = 52;
	var Five = 53;
	var Six = 54;
	var Seven = 55;
	var Eight = 56;
	var Nine = 57;
	var Colon = 58;
	var Semicolon = 59;
	var LessThan = 60;
	var Equals = 61;
	var GreaterThan = 62;
	var QuestionMark = 63;
	var At = 64;
	var A = 65;
	var B = 66;
	var C = 67;
	var D = 68;
	var E = 69;
	var F = 70;
	var G = 71;
	var H = 72;
	var I = 73;
	var J = 74;
	var K = 75;
	var L = 76;
	var M = 77;
	var N = 78;
	var O = 79;
	var P = 80;
	var Q = 81;
	var R = 82;
	var S = 83;
	var T = 84;
	var U = 85;
	var V = 86;
	var W = 87;
	var X = 88;
	var Y = 89;
	var Z = 90;
	var Win = 91;
	var ContextMenu = 93;
	var Sleep = 95;
	var Numpad0 = 96;
	var Numpad1 = 97;
	var Numpad2 = 98;
	var Numpad3 = 99;
	var Numpad4 = 100;
	var Numpad5 = 101;
	var Numpad6 = 102;
	var Numpad7 = 103;
	var Numpad8 = 104;
	var Numpad9 = 105;
	var Multiply = 106;
	var Add = 107;
	var Separator = 108;
	var Subtract = 109;
	var Decimal = 110;
	var Divide = 111;
	var F1 = 112;
	var F2 = 113;
	var F3 = 114;
	var F4 = 115;
	var F5 = 116;
	var F6 = 117;
	var F7 = 118;
	var F8 = 119;
	var F9 = 120;
	var F10 = 121;
	var F11 = 122;
	var F12 = 123;
	var F13 = 124;
	var F14 = 125;
	var F15 = 126;
	var F16 = 127;
	var F17 = 128;
	var F18 = 129;
	var F19 = 130;
	var F20 = 131;
	var F21 = 132;
	var F22 = 133;
	var F23 = 134;
	var F24 = 135;
	var NumLock = 144;
	var ScrollLock = 145;
	var WinOemFjJisho = 146;
	var WinOemFjMasshou = 147;
	var WinOemFjTouroku = 148;
	var WinOemFjLoya = 149;
	var WinOemFjRoya = 150;
	var Circumflex = 160;
	var Exclamation = 161;
	var DoubleQuote = 162;
	var Hash = 163;
	var Dollar = 164;
	var Percent = 165;
	var Ampersand = 166;
	var Underscore = 167;
	var OpenParen = 168;
	var CloseParen = 169;
	var Asterisk = 170;
	var Plus = 171;
	var Pipe = 172;
	var HyphenMinus = 173;
	var OpenCurlyBracket = 174;
	var CloseCurlyBracket = 175;
	var Tilde = 176;
	var VolumeMute = 181;
	var VolumeDown = 182;
	var VolumeUp = 183;
	var Comma = 188;
	var Period = 190;
	var Slash = 191;
	var BackQuote = 192;
	var OpenBracket = 219;
	var BackSlash = 220;
	var CloseBracket = 221;
	var Quote = 222;
	var Meta = 224;
	var AltGr = 225;
	var WinIcoHelp = 227;
	var WinIco00 = 228;
	var WinIcoClear = 230;
	var WinOemReset = 233;
	var WinOemJump = 234;
	var WinOemPA1 = 235;
	var WinOemPA2 = 236;
	var WinOemPA3 = 237;
	var WinOemWSCTRL = 238;
	var WinOemCUSEL = 239;
	var WinOemATTN = 240;
	var WinOemFinish = 241;
	var WinOemCopy = 242;
	var WinOemAuto = 243;
	var WinOemENLW = 244;
	var WinOemBackTab = 245;
	var ATTN = 246;
	var CRSEL = 247;
	var EXSEL = 248;
	var EREOF = 249;
	var Play = 250;
	var Zoom = 251;
	var PA1 = 253;
	var WinOemClear = 254;
}
