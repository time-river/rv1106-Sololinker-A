#ifndef __RK_AIQ_TYPES_ALDCH_ALGO_INT_H__
#define __RK_AIQ_TYPES_ALDCH_ALGO_INT_H__

#include "rk_aiq_types_aldch_algo.h"

typedef enum {
    RK_AIQ_LDCH_UPDATE_LUT_ON_LINE              = 0,    // generate lut inside rkaiq
    RK_AIQ_LDCH_UPDATE_LUT_FROM_EXTERNAL_FILE,          // external file import lut
    RK_AIQ_LDCH_UPDATE_LUT_FROM_EXTERNAL_BUFFER,        // external buffer import lut
} rk_aiq_ldch_update_lut_mode_t;

typedef struct rk_aiq_ldch_lut_external_file_s {
    char        config_file_dir[64];
    char        mesh_file_name[32];
} rk_aiq_ldch_lut_external_file_t;

typedef struct rk_aiq_ldch_lut_external_buffer_s {
    void*        addr;
    size_t       size;
} rk_aiq_ldch_lut_external_buffer_t;

typedef struct rk_aiq_ldch_custom_lut_s {
    bool        update_flag;
    union {
        rk_aiq_ldch_lut_external_file_t     file;
        rk_aiq_ldch_lut_external_buffer_t   buffer;
    } u;
} rk_aiq_ldch_custom_lut_t;

typedef struct rk_aiq_ldch_cfg_s {
    unsigned int en;
    int correct_level;

    rk_aiq_ldch_update_lut_mode_t update_lut_mode;
    rk_aiq_ldch_custom_lut_t      lut;
} rk_aiq_ldch_cfg_t;

#endif
