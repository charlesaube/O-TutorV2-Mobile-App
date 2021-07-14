import 'package:demo3/model/user.dart';
import 'package:demo3/network/services/IUser_repository.dart';

class UserService extends IUserRepository{

    fetchWeeklyGoal(){
      return 0.8;
    }

    User fetchUserById(int id){
      User user1 = new User(browser: "",lastLogin: 0, Password: '', username: 'Maxime', city: '', picture: '', Id: 1, affiliation: '', firstName: 'Maxime', office: '', ip_address: '', email: '', registrationDate: 1, profile: '', provState: '', idCategory: 1, LastName: '', country: '', nbConnect: 1, folder: '', logStatus: '');
        return user1;
    }

}

