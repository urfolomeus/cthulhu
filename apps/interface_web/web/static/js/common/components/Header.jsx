import React from 'react'

import styles from './Header.css'
import cthulhuLogo from '../../../assets/images/cthulhu-white.svg'

const Header = () =>
  <header className={styles.header}>
    <div className={styles.headerWrapper}>
      <img src={cthulhuLogo} className={styles.icon} data-logo />
      <h1 className={styles.headerText} data-header-text>Mad Monk</h1>
    </div>
  </header>

export default Header
