import Book from "../Card/Book";
import axios from "axios";
import React, { useState, useEffect } from "react";
import { Button } from 'antd';
import '../style.css'
const Main = () => {
  const [search, setSearch] = useState("React");
  const [bookData, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const fetchDetails = async () => {
      setIsLoading(true);
      const resources = await axios.get(
        'https://www.googleapis.com/books/v1/volumes?q=' + search + '&key=AIzaSyBPMocmlPxko34MeZSiR9LgxDwCPVZsMeM' + '&maxResults=40'
      );
      setData(resources.data.items);
      setIsLoading(false);
    };
    fetchDetails();
  }, [search]);

  const loadMore = async () => {
    const resources = await axios.get(
      `https://www.googleapis.com/books/v1/volumes?q=${search}&key=AIzaSyBPMocmlPxko34MeZSiR9LgxDwCPVZsMeM&maxResults=8&startIndex=${bookData.length}`
    );
    setData((oldDetails) => [...oldDetails, ...resources.data.items]);
  };

  const searchBook = (evt) => {
    if (evt.key === "Enter") {
      axios.get('https://www.googleapis.com/books/v1/volumes?q=' + search + '&key=AIzaSyBPMocmlPxko34MeZSiR9LgxDwCPVZsMeM' + '&maxResults=40')
        .then(res => setData(res.data.items))
        .catch(err => console.log(err))
    }
  }

  return (
    <div>
      <div className="header">
        <div className="row1">
          <h1>A room without books is like<br /> a body without a soul.</h1>
        </div>
        <div className="row2">
          <h2>Find Your Book</h2>
          <div className="search">
            <input type="text" placeholder="Enter Your Book Name"
              value={search} onChange={e => setSearch(e.target.value)}
              onKeyDown={searchBook} />
            <button><i className="fas fa-search"></i></button>
          </div>
          {/* <img src="./images/bg2.png" alt="" /> */}
        </div>
      </div>
      <div className="container">
        {<Book book={bookData} />}
      </div>
      <div className="load-more">
        <Button onClick={() => loadMore()} size="large" type="primary">Load more</Button>          </div>

    </div>
  );
};

export default Main;