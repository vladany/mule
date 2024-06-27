package com.example.mule;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, Dur, Mary, Maria, Flo, Inna, Soffel und Jessy, I hope you endjoy!";
    }

}
