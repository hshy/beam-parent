package com.hsshy.beam.modular.mini.dto;
import lombok.Data;

@Data
public class EncryptedData {

    private String code;

    private String encryptedData;

    private String iv;
}
