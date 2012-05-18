module Util (
    md5,
) where

import Data.ByteString  (ByteString)
import Data.Text        (Text)

import qualified Crypto.Hash.MD5        as MD5
import qualified Data.ByteString.Base16 as Base16
import qualified Data.Text.Encoding     as TE

-- | Return the MD5 hash of a 'ByteString', in lowercase hex format.
--
-- Example:
--
-- >[Only hash] <- query_ conn "SELECT md5('hi')"
-- >assertEqual "md5('hi')" (md5 "hi") hash
md5 :: ByteString -> Text
md5 = TE.decodeUtf8 . Base16.encode . MD5.hash
