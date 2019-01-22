package domain;

import java.io.Serializable;

/**
 * 要想使用redis存对象，一定要让实体类实现Serializable接口，否则会报错。
 */
public class User implements Serializable {

    private static final long serialVersionUID = -5244288298702801619L;
    private Integer uid;
    private String username;
    private String sex;
    private Integer age;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + uid +
                ", userName='" + username + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                '}';
    }
}
