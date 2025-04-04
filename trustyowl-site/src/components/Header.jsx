import React from 'react';
import { Link } from 'react-router-dom';
import './Header.css'; // Assuming you will create a Header.css for specific styles

const Header = () => {
    return (
        <header className="header">
            <h1>Trusty Owl</h1>
            <nav>
                <ul>
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/thank-you">Thank You</Link></li>
                </ul>
            </nav>
        </header>
    );
};

export default Header;