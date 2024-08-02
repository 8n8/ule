{-
Copied from https://github.com/ekmett/ansi-wl-pprint

Copyright 2008, Daan Leijen and Max Bolingbroke. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

  * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.

  * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in
    the documentation and/or other materials provided with the
    distribution.

This software is provided by the copyright holders "as is" and any
express or implied warranties, including, but not limited to, the
implied warranties of merchantability and fitness for a particular
purpose are disclaimed. In no event shall the copyright holders be
liable for any direct, indirect, incidental, special, exemplary, or
consequential damages (including, but not limited to, procurement of
substitute goods or services; loss of use, data, or profits; or
business interruption) however caused and on any theory of liability,
whether in contract, strict liability, or tort (including negligence
or otherwise) arising in any way out of the use of this software, even
if advised of the possibility of such damage.
-}
module Main (main) where

import Text.PrettyPrint.ANSI.Leijen

import System.IO


main :: IO ()
main = do
    -- Going directly to the console is portable across Unix and Windows...
    putDoc $ red (text "Red") <> comma <+> white (text "white") <+> text "and" <+> blue (text "blue") <> char '!' <> linebreak
    putDoc $ blue (text "Nested" <+> dullyellow (text "colors") <+> text "example") <> linebreak
    hPutDoc stdout $ onred (text "Red") <> comma <+> onwhite (text "white") <+> text "and" <+> onblue (text "blue") <> char '!' <> linebreak
    hPutDoc stdout $ onblue (text "Nested" <+> ondullyellow (text "colors") <+> text "example") <> linebreak
    
    -- ...but going via a string will only preserve formatting information information on Unix
    putStr $ show $ green (text "I will be green on Unix but uncolored on Windows") <> linebreak
    
    -- Let's see some non-color formatting:
    putDoc $ text "We can do" <+> bold (text "boldness") <> text ", if your terminal supports it, and even perhaps" <+> underline (text "underlining") <> linebreak

    -- Just a little test of the formatting removal:
    putDoc $ text "There is a handy utility called 'plain' to" <+> plain (bold $ text "remove formatting") <+>
              plain (text "if you need to e.g. support" <+> red (text "non-ANSI") <+> text "terminals")
