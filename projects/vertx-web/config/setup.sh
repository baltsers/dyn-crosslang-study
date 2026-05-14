# Configure ORBS for this project.
source config/config.sh

# prepare the work space
rm -rf work
cp -r orig work

# instrument the project

#-----------------Python Part-----------------
#sed -e "305 a\            fo = open(\"test.log\", \"w\")\n            fo.write(\"ORBS:\"+str(url))\n            fo.close()" < orig/vertx-web/src/test/sockjs-protocol/sockjs-protocol.py > work/vertx-web/src/test/sockjs-protocol/sockjs-protocol.py
#sed -e "106 a\        fo = open(\"test.log\", \"w\")\n        fo.write(\"ORBS:\"+str(r))\n        fo.close()" < orig/vertx-web/src/test/sockjs-protocol/sockjs-protocol.py > work/vertx-web/src/test/sockjs-protocol/sockjs-protocol.py
     
        
        

#-----------------Java Part-----------------
#sed -e "195 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + port);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java
#sed -e "195 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + host);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/ForwardedParser.java
#sed -e "92 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + c);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java
#sed -e "142 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + sep0);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/Origin.java
#sed -e "749 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + contentType);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/RoutingContext.java > work/vertx-web/src/main/java/io/vertx/ext/web/RoutingContext.java
#sed -e "802 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + etag);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/RoutingContext.java > work/vertx-web/src/main/java/io/vertx/ext/web/RoutingContext.java
sed -e "877 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + strip);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/RouteState.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/RouteState.java
#sed -e "1053 a\        try {\n            BufferedWriter out = new BufferedWriter(new FileWriter(\"test.log\", true));\n            out.write(\"ORBS: \" + reqLen);\n			out.write(\"\\\n\");\n            out.flush();\n            out.close();\n        } catch (IOException e) {\n        }" < orig/vertx-web/src/main/java/io/vertx/ext/web/impl/RouteState.java > work/vertx-web/src/main/java/io/vertx/ext/web/impl/RouteState.java



