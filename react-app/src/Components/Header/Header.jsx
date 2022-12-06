import React, { useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { notification, Menu } from "antd";
import { MailOutlined, AppstoreOutlined, SettingOutlined } from '@ant-design/icons';
import { SmileOutlined, FrownTwoTone } from "@ant-design/icons";

const Header = () => {
  // const isLogined = useSelector((state) => state.user.isLogined);
  // const loginedUser = useSelector((state) => state.user.loginedUser);
  // // const isLogined = false
  // // const loginedUser = {name: 'xj',age:'21'}

  // //页面挂载的时候，判断有没有cookie，然后设置页面的登录状态
  // useEffect(() => {
  //   userIsLogined().then(res => {
  //     if (res.data.code === 0) {
  //       dispatch({ type: 'set-isLogined', payload: true })
  //       dispatch({ type: 'set-loginedUser', payload: res.data.user })
  //     }
  //   })
  // }, []);

  // const dispatch = useDispatch()
  // const navigate = useNavigate();
  // const quit = () => {
  //   signOut().then(res => {
  //     if (res.data.code === 0) {
  //       notification.open({
  //         message: "Successful logout！",
  //         description: "You have successfully logged out, welcome to play again!",
  //         icon: <SmileOutlined style={{ color: "#108ee9" }} />,
  //       });
  //       dispatch({ type: 'set-isLogined', payload: false })
  //       dispatch({ type: 'set-loginedUser', payload: {} })
  //     } else {
  //       notification.open({
  //         message: 'Logout failure！',
  //         description:
  //           "An unknown error occurred",
  //         icon: <FrownTwoTone style={{ color: '#ff4c4c' }} />,
  //       });
  //     }
  //   })
  // };

  // const goToHome = () => {
  //   navigate("/home/total");
  // };
  // const login = () => {
  //   navigate("/login")
  // }
  // const register = () => {
  //   navigate("/register")
  // }



  return (
    <>
<nav class="nav">  
  <div class="flex-item">Home</div>
  <div class="flex-item">Account</div>
</nav>
    </>
  );
};

export default Header;