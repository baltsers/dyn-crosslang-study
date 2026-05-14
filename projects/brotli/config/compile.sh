# Configure ORBS for this project.
source config/config.sh

cd work
#-------- python part --------------#
# cd python
# make clean 1> /dev/null 2> /dev/null
# make 1> make_result.log 2> /dev/null
# cd ..

# if [  -f "./python/_brotli.so" ]; then   
   # # The signature must be created from anything that actually
    # # influences the execution which is affected by the slicing
    # # operation. Usually it is any executed part, binaries and
    # # scripts.
	
    # md5sum  ./bin/temp.linux-x86_64-2.7/c/common/constants.o ./bin/temp.linux-x86_64-2.7/c/common/context.o ./bin/temp.linux-x86_64-2.7/c/common/dictionary.o ./bin/temp.linux-x86_64-2.7/c/common/platform.o ./bin/temp.linux-x86_64-2.7/c/common/transform.o ./bin/temp.linux-x86_64-2.7/c/dec/bit_reader.o ./bin/temp.linux-x86_64-2.7/c/dec/decode.o ./bin/temp.linux-x86_64-2.7/c/dec/huffman.o ./bin/temp.linux-x86_64-2.7/c/dec/state.o ./bin/temp.linux-x86_64-2.7/c/enc/backward_references.o ./bin/temp.linux-x86_64-2.7/c/enc/backward_references_hq.o ./bin/temp.linux-x86_64-2.7/c/enc/bit_cost.o ./bin/temp.linux-x86_64-2.7/c/enc/block_splitter.o ./bin/temp.linux-x86_64-2.7/c/enc/brotli_bit_stream.o ./bin/temp.linux-x86_64-2.7/c/enc/cluster.o ./bin/temp.linux-x86_64-2.7/c/enc/command.o ./bin/temp.linux-x86_64-2.7/c/enc/compress_fragment.o ./bin/temp.linux-x86_64-2.7/c/enc/compress_fragment_two_pass.o ./bin/temp.linux-x86_64-2.7/c/enc/dictionary_hash.o ./bin/temp.linux-x86_64-2.7/c/enc/encode.o ./bin/temp.linux-x86_64-2.7/c/enc/encoder_dict.o ./bin/temp.linux-x86_64-2.7/c/enc/entropy_encode.o ./bin/temp.linux-x86_64-2.7/c/enc/fast_log.o ./bin/temp.linux-x86_64-2.7/c/enc/histogram.o ./bin/temp.linux-x86_64-2.7/c/enc/literal_cost.o ./bin/temp.linux-x86_64-2.7/c/enc/memory.o ./bin/temp.linux-x86_64-2.7/c/enc/metablock.o ./bin/temp.linux-x86_64-2.7/c/enc/static_dict.o ./bin/temp.linux-x86_64-2.7/c/enc/utf8_util.o ./bin/temp.linux-x86_64-2.7/python/_brotli.o ./python/_brotli.so ./python/bro.py ./python/brotli.py ./python/tests/bro_test.py ./python/tests/compressor_test.py ./python/tests/compress_test.py ./python/tests/decompressor_test.py ./python/tests/decompress_test.py ./python/tests/_test_utils.py ./python/tests/__init__.py ./research/brotlidump.py ./scripts/fix-win-bazel-build.py ./scripts/dictionary/step-01-download-rfc.py ./scripts/dictionary/step-02-rfc-to-bin.py ./scripts/dictionary/step-03-validate-bin.py ./scripts/dictionary/step-04-generate-java-literals.py 
	# #echo Succ
# else
    # # In case compilation fails, "FAIL" must be returned.
    # echo FAIL
# fi

#-------- java part --------------#
# cd java/org/brotli
# mvn clean 1> /dev/null 2> /dev/null
# mvn compile 1> compile_result.log 2> /dev/null

# cd ../../..


# if [  -d "./java/org/brotli/dec/target/classes/org" ]; then   
   # # The signature must be created from anything that actually
    # # influences the execution which is affected by the slicing
    # # operation. Usually it is any executed part, binaries and
    # # scripts.
	
    # md5sum  ./java/org/brotli/dec/target/classes/org/brotli/dec/BitReader.class ./java/org/brotli/dec/target/classes/org/brotli/dec/BrotliInputStream.class ./java/org/brotli/dec/target/classes/org/brotli/dec/BrotliRuntimeException.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Context.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Decode.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Dictionary\$DataLoader.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Dictionary.class ./java/org/brotli/dec/target/classes/org/brotli/dec/DictionaryData.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Huffman.class ./java/org/brotli/dec/target/classes/org/brotli/dec/State.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Transform\$Transforms.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Transform.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Utils.class
	# #echo Succ
# else
    # # In case compilation fails, "FAIL" must be returned.
    # echo FAIL
# fi

#-------- c part --------------#
cd java/org/brotli
mvn clean 1> /dev/null 2> /dev/null
mvn compile 1> compile_result.log 2> /dev/null
cd ../../..

cd python
make clean 1> /dev/null 2> /dev/null
make 1> make_result.log 2> /dev/null
cd ..

cd out
make clean 1> /dev/null 2> /dev/null
make 1> make_result.log 2> /dev/null
cd ..

if [[ -d "./java/org/brotli/dec/target/classes/org" && -f "./python/_brotli.so" && -f "./out/CMakeFiles/brotlidec.dir/c/dec/state.c.o" ]]; then   
   # The signature must be created from anything that actually
    # influences the execution which is affected by the slicing
    # operation. Usually it is any executed part, binaries and
    # scripts.
	
    md5sum  ./bin/temp.linux-x86_64-2.7/c/common/constants.o ./bin/temp.linux-x86_64-2.7/c/common/context.o ./bin/temp.linux-x86_64-2.7/c/common/dictionary.o ./bin/temp.linux-x86_64-2.7/c/common/platform.o ./bin/temp.linux-x86_64-2.7/c/common/transform.o ./bin/temp.linux-x86_64-2.7/c/dec/bit_reader.o ./bin/temp.linux-x86_64-2.7/c/dec/decode.o ./bin/temp.linux-x86_64-2.7/c/dec/huffman.o ./bin/temp.linux-x86_64-2.7/c/dec/state.o ./bin/temp.linux-x86_64-2.7/c/enc/backward_references.o ./bin/temp.linux-x86_64-2.7/c/enc/backward_references_hq.o ./bin/temp.linux-x86_64-2.7/c/enc/bit_cost.o ./bin/temp.linux-x86_64-2.7/c/enc/block_splitter.o ./bin/temp.linux-x86_64-2.7/c/enc/brotli_bit_stream.o ./bin/temp.linux-x86_64-2.7/c/enc/cluster.o ./bin/temp.linux-x86_64-2.7/c/enc/command.o ./bin/temp.linux-x86_64-2.7/c/enc/compress_fragment.o ./bin/temp.linux-x86_64-2.7/c/enc/compress_fragment_two_pass.o ./bin/temp.linux-x86_64-2.7/c/enc/dictionary_hash.o ./bin/temp.linux-x86_64-2.7/c/enc/encode.o ./bin/temp.linux-x86_64-2.7/c/enc/encoder_dict.o ./bin/temp.linux-x86_64-2.7/c/enc/entropy_encode.o ./bin/temp.linux-x86_64-2.7/c/enc/fast_log.o ./bin/temp.linux-x86_64-2.7/c/enc/histogram.o ./bin/temp.linux-x86_64-2.7/c/enc/literal_cost.o ./bin/temp.linux-x86_64-2.7/c/enc/memory.o ./bin/temp.linux-x86_64-2.7/c/enc/metablock.o ./bin/temp.linux-x86_64-2.7/c/enc/static_dict.o ./bin/temp.linux-x86_64-2.7/c/enc/utf8_util.o ./bin/temp.linux-x86_64-2.7/python/_brotli.o ./out/libbrotlicommon.so ./out/libbrotlidec.so ./out/libbrotlienc.so ./out/CMakeFiles/brotli.dir/c/tools/brotli.c.o ./out/CMakeFiles/brotlicommon-static.dir/c/common/constants.c.o ./out/CMakeFiles/brotlicommon-static.dir/c/common/context.c.o ./out/CMakeFiles/brotlicommon-static.dir/c/common/dictionary.c.o ./out/CMakeFiles/brotlicommon-static.dir/c/common/platform.c.o ./out/CMakeFiles/brotlicommon-static.dir/c/common/transform.c.o ./out/CMakeFiles/brotlicommon.dir/c/common/constants.c.o ./out/CMakeFiles/brotlicommon.dir/c/common/context.c.o ./out/CMakeFiles/brotlicommon.dir/c/common/dictionary.c.o ./out/CMakeFiles/brotlicommon.dir/c/common/platform.c.o ./out/CMakeFiles/brotlicommon.dir/c/common/transform.c.o ./out/CMakeFiles/brotlidec-static.dir/c/dec/bit_reader.c.o ./out/CMakeFiles/brotlidec-static.dir/c/dec/decode.c.o ./out/CMakeFiles/brotlidec-static.dir/c/dec/huffman.c.o ./out/CMakeFiles/brotlidec-static.dir/c/dec/state.c.o ./out/CMakeFiles/brotlidec.dir/c/dec/bit_reader.c.o ./out/CMakeFiles/brotlidec.dir/c/dec/decode.c.o ./out/CMakeFiles/brotlidec.dir/c/dec/huffman.c.o ./out/CMakeFiles/brotlidec.dir/c/dec/state.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/backward_references.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/backward_references_hq.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/bit_cost.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/block_splitter.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/brotli_bit_stream.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/cluster.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/command.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/compress_fragment.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/compress_fragment_two_pass.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/dictionary_hash.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/encode.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/encoder_dict.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/entropy_encode.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/fast_log.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/histogram.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/literal_cost.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/memory.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/metablock.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/static_dict.c.o ./out/CMakeFiles/brotlienc-static.dir/c/enc/utf8_util.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/backward_references.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/backward_references_hq.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/bit_cost.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/block_splitter.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/brotli_bit_stream.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/cluster.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/command.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/compress_fragment.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/compress_fragment_two_pass.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/dictionary_hash.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/encode.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/encoder_dict.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/entropy_encode.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/fast_log.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/histogram.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/literal_cost.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/memory.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/metablock.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/static_dict.c.o ./out/CMakeFiles/brotlienc.dir/c/enc/utf8_util.c.o ./python/bro.py ./python/brotli.py ./python/_brotli.so ./python/tests/bro_test.py ./python/tests/compressor_test.py ./python/tests/compress_test.py ./python/tests/decompressor_test.py ./python/tests/decompress_test.py ./python/tests/_test_utils.py ./python/tests/__init__.py ./research/brotlidump.py ./scripts/fix-win-bazel-build.py ./scripts/dictionary/step-01-download-rfc.py ./scripts/dictionary/step-02-rfc-to-bin.py ./scripts/dictionary/step-03-validate-bin.py ./scripts/dictionary/step-04-generate-java-literals.py ./java/org/brotli/dec/target/classes/org/brotli/dec/BitReader.class ./java/org/brotli/dec/target/classes/org/brotli/dec/BrotliInputStream.class ./java/org/brotli/dec/target/classes/org/brotli/dec/BrotliRuntimeException.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Context.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Decode.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Dictionary\$DataLoader.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Dictionary.class ./java/org/brotli/dec/target/classes/org/brotli/dec/DictionaryData.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Huffman.class ./java/org/brotli/dec/target/classes/org/brotli/dec/State.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Transform\$Transforms.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Transform.class ./java/org/brotli/dec/target/classes/org/brotli/dec/Utils.class
	#echo Succ
else
    # In case compilation fails, "FAIL" must be returned.
    echo FAIL
fi



#ORBS have a problem that if first compile return FAIL, then it will record it and compared it with others
