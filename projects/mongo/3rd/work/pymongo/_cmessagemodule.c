






















#include "Python.h"

#include "_cbsonmodule.h"
#include "buffer.h"












































static int add_last_error(PyObject* self, buffer_t buffer,
                          int request_id, char* ns, Py_ssize_t nslen,
                          codec_options_t* options, PyObject* args) {


















    if (!buffer_write_int32(buffer, (int32_t)request_id) ||






        !buffer_write_bytes(buffer,


                            "\xFF\xFF\xFF\xFF", /* limit (-1) */
                            14)) {


























    }













}

static int init_insert_buffer(buffer_t buffer, int request_id, int options,
                              const char* coll_name, Py_ssize_t coll_name_len,
                              int compress) {

    if (!compress) {





        if (!buffer_write_int32(buffer, (int32_t)request_id) ||
            !buffer_write_bytes(buffer,

                                "\xd2\x07\x00\x00",
                                8)) {

        }
    }
    if (!buffer_write_int32(buffer, (int32_t)options) ||
        !buffer_write_bytes_ssize_t(buffer,

                                    coll_name_len + 1)) {

    }

}

static PyObject* _cbson_insert_message(PyObject* self, PyObject* args) {





    int request_id = rand();
    char* collection_name = NULL;
    Py_ssize_t collection_name_length;




    int flags = 0;





    buffer_t buffer = NULL;
    int length_location, message_length;




















    length_location = init_insert_buffer(buffer,
                                         request_id,
                                         flags,
                                         collection_name,
                                         collection_name_length,
                                         0);































































}

static PyObject* _cbson_update_message(PyObject* self, PyObject* args) {

















































































































































































































































































































    int request_id = rand();








    buffer_t buffer = NULL;




























    if (!buffer_write_int32(buffer, (int32_t)request_id) ||
        !buffer_write_bytes(buffer,

                            "\xdd\x07\x00\x00" /* 2013 */, 8)) {




















































































    }
}


_send_insert(PyObject* self, PyObject* ctx,
             PyObject* gle_args, buffer_t buffer,
             char* coll_name, Py_ssize_t coll_len, int request_id, int safe,
             codec_options_t* options, PyObject* to_publish, int compress) {


















}

static PyObject* _cbson_do_batched_insert(PyObject* self, PyObject* args) {



    int request_id = rand();
    int send_safe, flags = 0;
    int length_location, message_length;
    Py_ssize_t collection_name_length;
    int compress;
    char* collection_name = NULL;


    PyObject* iterator;
    PyObject* ctx;
    PyObject* last_error_args;
    PyObject* result;



    PyObject* to_publish = NULL;



    codec_options_t options;
    unsigned char empty = 1;
    long max_bson_size;

    buffer_t buffer;

































































    length_location = init_insert_buffer(buffer,
                                         request_id,
                                         flags,
                                         collection_name,
                                         collection_name_length,
                                         compress);









    if (iterator == NULL) {









        int cur_size;






        if (cur_size > max_bson_size) {

            if (!empty) {






                result = _send_insert(self, ctx, last_error_args, buffer,
                                      collection_name, collection_name_length,
                                      request_id, send_safe, &options,
                                      to_publish, compress);



            }







            int new_request_id = rand();
            int message_start;
            buffer_t new_buffer = buffer_new();



            message_start = init_insert_buffer(new_buffer,
                                               new_request_id,
                                               flags,
                                               collection_name,
                                               collection_name_length,
                                               compress);




















            result = _send_insert(self, ctx, last_error_args, buffer,
                                  collection_name, collection_name_length,
                                  request_id, send_safe, &options, to_publish,
                                  compress);





























































        }














































    }














}








_batched_op_msg(
        unsigned char op, unsigned char check_keys, unsigned char ack,
        PyObject* command, PyObject* docs, PyObject* ctx,
        PyObject* to_publish, codec_options_t options,
        buffer_t buffer, struct module_state *state) {



























































































































































































}


_cbson_encode_batched_op_msg(PyObject* self, PyObject* args) {
    unsigned char op;
    unsigned char check_keys;
    unsigned char ack;
    PyObject* command;
    PyObject* docs;
    PyObject* ctx = NULL;
    PyObject* to_publish = NULL;

    codec_options_t options;
    buffer_t buffer;
    struct module_state *state = GETSTATE(self);















    if (!_batched_op_msg(
            op,
            check_keys,
            ack,
            command,
            docs,
            ctx,
            to_publish,
            options,
            buffer,
            state)) {

    }










}


_cbson_batched_op_msg(PyObject* self, PyObject* args) {
    unsigned char op;
    unsigned char check_keys;
    unsigned char ack;


    PyObject* command;
    PyObject* docs;
    PyObject* ctx = NULL;
    PyObject* to_publish = NULL;

    codec_options_t options;
    buffer_t buffer;
    struct module_state *state = GETSTATE(self);















    if (!buffer_write_bytes(buffer,

                            "\xdd\x07\x00\x00", /* opcode */
                            8)) {




    }

    if (!_batched_op_msg(
            op,
            check_keys,
            ack,
            command,
            docs,
            ctx,
            to_publish,
            options,
            buffer,
            state)) {

    }














}




_batched_write_command(
        char* ns, Py_ssize_t ns_len, unsigned char op, int check_keys,
        PyObject* command, PyObject* docs, PyObject* ctx,
        PyObject* to_publish, codec_options_t options,
        buffer_t buffer, struct module_state *state) {

























































    if (!buffer_write_bytes(buffer,





                            "\xFF\xFF\xFF\xFF", /* limit (-1) */
                             8)) {



























































































































    }





















}


_cbson_encode_batched_write_command(PyObject* self, PyObject* args) {
    char *ns = NULL;
    unsigned char op;
    unsigned char check_keys;
    Py_ssize_t ns_len;
    PyObject* command;
    PyObject* docs;
    PyObject* ctx = NULL;
    PyObject* to_publish = NULL;

    codec_options_t options;
    buffer_t buffer;
    struct module_state *state = GETSTATE(self);
















    if (!_batched_write_command(
            ns,
            ns_len,
            op,
            check_keys,
            command,
            docs,
            ctx,
            to_publish,
            options,
            buffer,
            state)) {

    }











}


_cbson_batched_write_command(PyObject* self, PyObject* args) {
    char *ns = NULL;
    unsigned char op;
    unsigned char check_keys;
    Py_ssize_t ns_len;


    PyObject* command;
    PyObject* docs;
    PyObject* ctx = NULL;
    PyObject* to_publish = NULL;

    codec_options_t options;
    buffer_t buffer;
    struct module_state *state = GETSTATE(self);
















    if (!buffer_write_bytes(buffer,

                            "\xd4\x07\x00\x00", /* opcode */
                            8)) {




    }

    if (!_batched_write_command(
            ns,
            ns_len,
            op,
            check_keys,
            command,
            docs,
            ctx,
            to_publish,
            options,
            buffer,
            state)) {

    }







































};

#if PY_MAJOR_VERSION >= 3

























#else


init_cmessage(void)
#endif
{
























































}
