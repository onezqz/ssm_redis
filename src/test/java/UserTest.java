import domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserService;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration ("classpath:applicationContext.xml")
public class UserTest {
    @Autowired
    private UserService userService;

    @Test
    public void test(){
        List <User> allUser = userService.getAllUser();
        for(User u:allUser){
            User byUid = userService.findUserByUid(String.valueOf(u.getUid()));
            System.out.println(byUid);
        }
    }
}
