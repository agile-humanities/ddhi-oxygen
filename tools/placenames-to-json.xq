xquery version "3.0";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method   "json";

let $places := 
    for $subject in root()//tei:standOff//tei:place
    return
        map {
            "id": xs:string($subject/@xml:id),
            "placeName": $subject/tei:placeName/text() }



return array { $places }