<template>
    <b-form @submit.stop.prevent="onSubmit" @reset="onReset" v-if="status != ''">
            <b-card header="จัดการข้อมูลหัวข้อย่อย">                                  
                
            <b-row>
                <b-col>
                    <b-form-group id="a_order"
                                label="ลำดับ:"
                                label-for="topic_order">
                                <b-form-select id="topic_order"
                                            :options="t_order_list"
                                            required
                                            size="sm"
                                            v-model="t_order">
                                </b-form-select>
                            </b-form-group>
                </b-col>
            </b-row>
            <b-row>
                <b-col >
                    <b-form-group id="lblTopicName"
                        label="หัวข้อย่อย :"
                        label-for="t_name">
                        <b-form-input id="t_name"
                                    type="text"
                                    v-model="t_name"
                                    required
                                    size="sm"
                                    placeholder="ใส่ชื่อหัวข้อย่อย">
                        </b-form-input>
                    
                    </b-form-group>
                </b-col>
            </b-row>
            <b-row>
                <b-col>
                    <b-form-group id="lblTopicDetail"
                        label="รายละเอียด :"
                        label-for="t_detail">
                        <b-form-input id="t_detail"
                                    type="text"
                                    v-model="t_detail"
                                    required
                                    size="sm"
                                    :rows="10"
                                    placeholder="ใส่รายละเอียด">
                        </b-form-input>
                        <vue-editor></vue-editor>
                    </b-form-group>
                </b-col>
            </b-row>
            </b-card>
        </b-form>
</template>
