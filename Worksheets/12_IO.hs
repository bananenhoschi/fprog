import Network.HTTP
import Data.Aeson

url = "http://api.icndb.com/jokes/random"

get :: String -> IO String
get url = simpleHTTP (getRequest url) >>= getResponseBody

main = get url
