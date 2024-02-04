# Copyright (c) 2023 Amphion.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

######## Build Experiment Environment ###########
exp_dir=$(cd `dirname $0`; pwd)
work_dir=$(dirname $(dirname $(dirname $exp_dir)))

export WORK_DIR=$work_dir
export PYTHONPATH=$work_dir
export PYTHONIOENCODING=UTF-8
 
######## Set Experiment Configuration ###########

if [ -z "$exp_config" ]; then
    exp_config="${exp_dir}"/exp_config.json
fi
echo "Exprimental Configuration File: $exp_config"

exp_name="ns2_vc"

if [ -z "$gpu" ]; then
    gpu="0,1,2,3"
fi

CUDA_VISIBLE_DEVICES=$gpu python \
    "${work_dir}"/bins/tts/train.py \
    --config=$exp_config \
    --exp_name=$exp_name \
    --log_level info