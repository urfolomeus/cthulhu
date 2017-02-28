import { expect } from 'chai'
import { shallow } from 'enzyme'

import React from 'react'

import Header from './Header'

describe('<Header />', () => {
  let wrapper

  beforeEach(() => {
    wrapper = shallow(<Header />)
  })

  it('has a logo', () => {
    expect(wrapper).to.have.exactly(1).descendants('img[data-logo]')
  })

  it('has header text', () => {
    expect(wrapper.find('h1[data-header-text]')).to.have.text('Mad Monk')
  })
})
